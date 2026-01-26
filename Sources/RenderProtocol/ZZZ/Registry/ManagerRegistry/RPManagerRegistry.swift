//
//  RPManagerRegistry.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation

internal actor RPManagerRegistry {
    static let shared = RPManagerRegistry()
    private init() {}
    
    private var store = [String: any RPManager]()
    
    func register<M: RPManager>(_ manager: M) async throws {
        store[await manager.id] = manager
        try await manager.didRegister()
    }
    
    func unregister(_ id: String) async throws {
        try await store[id]?.willUnregister()
        store[id] = nil
    }
    
    func getManager<M: RPManager>(with id: String) -> M? {
        store[id] as? M
    }
    
    @discardableResult
    func forEachManager<R: Sendable>(
        _ body: @Sendable @escaping (any RPManager) async throws -> R
    ) async rethrows -> [R] {
        try await Array(store.values).concurrentAsyncMap(body)
    }
}
