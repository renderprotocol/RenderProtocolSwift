//
//  RPRenderRemoteDataSource.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation
import RPGeneratedSwift
import GRPCNIOTransportHTTP2

internal protocol RPRenderRemoteDataSource: Actor {
    func makeRenderServiceClient() throws(RPError) -> RPRenderServiceClient
}
