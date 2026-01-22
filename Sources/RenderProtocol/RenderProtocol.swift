// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import GRPCCore
import GRPCNIOTransportHTTP2
import RPGeneratedSwift

public final class RenderProtocol: Sendable {
    typealias RPClient = RPRenderService.Client<HTTP2ClientTransport.TransportServices>
    
    actor MutableStorage {
        private(set) var client: RPClient?
        func set(client: RPClient) { self.client = client }
    }
    
    private let storage = MutableStorage()
    
    public init() {
        Task { @concurrent in
            do {
                let client = try await makeClient()
                await storage.set(client: client)
            } catch {
                debugPrint("----->>> Failed to create client: \(error)")
            }
        }
    }
    
    @concurrent public func dryRun() async throws -> RPWidget? {
        guard let client = await storage.client else { return nil }
        
        var req = RPFetchViewRequest()
        req.sessionToken = UUID().uuidString
        req.viewID = UUID().uuidString
        
        let resp = try await client.rpFetchView(request: ClientRequest(message: req))
        return resp.view
    }
    
    private func currentThread() -> Thread { .current }
    
    private func makeClient() async throws -> RPClient {
        let transport = try HTTP2ClientTransport.TransportServices(
            target: .ipv4(address: "127.0.0.1", port: 50051),
            transportSecurity: .plaintext
        )
        let gRPCClient = GRPCClient(transport: transport)
        Task { try await gRPCClient.runConnections() }
        return RPRenderService.Client(wrapping: gRPCClient)
    }
}
