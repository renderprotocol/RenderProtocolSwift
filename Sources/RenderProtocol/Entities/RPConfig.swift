//
//  RPConfig.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation

public struct RPConfig: RPPortable {
    public let id: UUID
    let address: String
    let port: Int
    
    public init(address: String, port: Int) {
        self.id = UUID()
        self.address = address
        self.port = port
    }
}
