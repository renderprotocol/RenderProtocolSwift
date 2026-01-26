//
//  Array+Extensions.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation

public extension Array {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var result = [T]()
        result.reserveCapacity(count)
        for element in self {
            result.append(try await transform(element))
        }
        return result
    }
}

public extension Array where Element: Sendable {
    func concurrentAsyncMap<T: Sendable>(
        _ transform: @Sendable @escaping (Element) async throws -> T
    ) async rethrows -> [T] {
        try await withThrowingTaskGroup(of: (Int, T).self) { group in
            for (index, element) in self.enumerated() {
                group.addTask {
                    (index, try await transform(element))
                }
            }
            var result = Array<T?>(repeating: nil, count: count)
            result.reserveCapacity(count)
            for try await (index, value) in group {
                result[index] = value
            }
            return result.compactMap { $0 }
        }
    }
}
