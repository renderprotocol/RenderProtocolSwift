//
//  RPNetworkManager.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation
import GRPCCore
import GRPCNIOTransportHTTP2
import RPGeneratedSwift

internal actor RPNetworkManager: RPManager {
    typealias ConnectionTask = Task<Void, Error>
    
    let id: String = RPConstants.networkManagerID
    
    let address: String
    let port: Int
    
    private var connectionClient: RPClient?
    private var connectionTask: ConnectionTask?
    
    init(address: String, port: Int) {
        self.address = address
        self.port = port
    }
    
    func connect() async throws {
        let connection = try await makeConnection(address: address, port: port)
        self.connectionClient = connection.client
        self.connectionTask = connection.task
    }
    
    private func makeConnection(address: String, port: Int) async throws -> (client: RPClient, task: ConnectionTask) {
        let transport = try HTTP2ClientTransport.TransportServices(
            target: .ipv4(address: address, port: port),
            transportSecurity: .plaintext
        )
        let gRPCClient = GRPCClient(transport: transport)
        let task = Task.detached { try await gRPCClient.runConnections() }
        return (RPRenderService.Client(wrapping: gRPCClient), task)
    }
}
