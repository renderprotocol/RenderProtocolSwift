//
//  RPRenderServiceProvider.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation
import RPGeneratedSwift

internal struct RPRenderServiceProvider {
    let localDataSource: any RPRenderServiceLocalDataSource
    let remoteDataSource: any RPRenderServiceRemoteDataSource
    
    func fetch() async throws -> RPWidget {
        let client = try await remoteDataSource.makeRenderServiceClient()
        let req = RPFetchRenderTreeRequest()
        let resp = try await client.rpFetchRenderTree(request: .init(message: req))
        return resp.view
    }
}
