// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import RPGeneratedSwift

public enum RenderProtocol {
    static func initialize(with config: RPConfig) async throws {
        let networkManager = RPNetworkManager(address: config.address, port: config.port)
        try await networkManager.connect()
        
        try await RPManagerRegistry.shared.register(networkManager)
    }
    
    static func fetchRenderTree<Id: RPRenderTreeId>(with id: Id) {}
    
    static func invalidateRenderTreeCache<Id: RPRenderTreeId>(with id: Id) {}
    
    static func register<Plugin: RPPlugin>(plugin: Plugin) async throws {
        try await RPPluginRegistry.shared.register(plugin)
    }
    
    static func unregister(pluginWithId id: String) async throws {
        try await RPPluginRegistry.shared.unregister(id)
    }
    
    static func debugOverlay(visible: Bool) async {
        await RPPluginRegistry.shared.forEachPlugin { plugin in
            await plugin.didRequestDebugOverlayVisibilityChange(to: visible)
        }
    }
}
