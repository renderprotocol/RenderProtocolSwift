//
//  RPNetworkManager+Extensions.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation
import RPGeneratedSwift
import GRPCNIOTransportHTTP2

extension RPNetworkManager: RPRenderServiceRemoteDataSource {
    func makeRenderServiceClient() throws(RPError) -> RPRenderServiceClient {
        guard let connectionClient else { throw .notInitialized }
        return .init(wrapping: connectionClient)
    }
}
