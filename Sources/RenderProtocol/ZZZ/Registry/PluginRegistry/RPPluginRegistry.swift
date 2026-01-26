//
//  RPPluginRegistry.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation

internal actor RPPluginRegistry {
    static let shared = RPPluginRegistry()
    private init() {}
    
    private var store = [String: any RPPlugin]()
    
    func register<P: RPPlugin>(_ plugin: P) async throws {
        store[await plugin.id] = plugin
        try await plugin.didRegister()
    }
    
    func unregister(_ id: String) async throws {
        try await store[id]?.willUnregister()
        store[id] = nil
    }
    
    func getPlugin<P: RPPlugin>(with id: String) -> P? {
        store[id] as? P
    }
    
    @discardableResult
    func forEachPlugin<R: Sendable>(
        _ body: @Sendable @escaping (any RPPlugin) async throws -> R
    ) async rethrows -> [R] {
        try await Array(store.values).concurrentAsyncMap(body)
    }
}
