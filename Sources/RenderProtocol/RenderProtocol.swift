// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import RPUtilsSwift
public import RPGeneratedSwift

public enum RenderProtocol {
    @concurrent public static func initialize(with config: RPConfig) async throws {
        let cacheManager = RPCacheManager()
        
        let networkManager = RPNetworkManager(address: config.address, port: config.port)
        try await networkManager.connect()
        
        try await RPManagerRegistry.shared.register(cacheManager)
        try await RPManagerRegistry.shared.register(networkManager)
        
        let handshakeProvider = RPHandshakeServiceProvider()
    }
    
    @concurrent public static func fetchRenderTree(with id: String) async throws -> RPWidget {
        guard let cacheManager: RPCacheManager = await getManager(RPConstants.cacheManagerID),
              let networkManager: RPNetworkManager = await getManager(RPConstants.networkManagerID)
        else { throw RPError.notInitialized }
        
        let provider = RPRenderServiceProvider(localDataSource: cacheManager, remoteDataSource: networkManager)
        
        return try await provider.fetch()
    }
    
    private static func getManager<T: RPManager>(_ id: String) async -> T? {
        await RPManagerRegistry.shared.getManager(with: id)
    }
    
    @concurrent public static func invalidateRenderTreeCache(with id: String) async {}
    
    @concurrent public static func register<Plugin: RPPlugin>(plugin: Plugin) async throws {
        try await RPPluginRegistry.shared.register(plugin)
    }
    
    @concurrent public static func unregister(pluginWithId id: String) async throws {
        try await RPPluginRegistry.shared.unregister(id)
    }
    
    @concurrent public static func debugOverlay(visible: Bool) async {
        await RPPluginRegistry.shared.forEachPlugin { plugin in
            await plugin.didRequestDebugOverlayVisibilityChange(to: visible)
        }
    }
}

enum RPFetchPolicy: String, RPPortableEnum {
    case cacheFirst
    case remoteFirst
    case cacheOnly
    case remoteOnly
    
    var id: String { rawValue }
}
