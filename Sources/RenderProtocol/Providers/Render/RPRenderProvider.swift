//
//  RPRenderProvider.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation
import RPGeneratedSwift

internal struct RPRenderProvider {
    let localDataSource: any RPRenderLocalDataSource
    let remoteDataSource: any RPRenderRemoteDataSource
    
    func fetch() async throws -> RPWidget {
        let client = try await remoteDataSource.makeRenderServiceClient()
        let req = RPFetchViewRequest()
        let resp = try await client.rpFetchView(request: .init(message: req))
        return resp.view
    }
}
