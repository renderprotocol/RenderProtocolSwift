//
//  RenderProtocolExampleApp.swift
//  RenderProtocolExample
//
//  Created by Arindam Karmakar on 07/12/25.
//

import SwiftUI
import RenderProtocol

@main
struct RenderProtocolExampleApp: App {
    @State var navigationPath = NavigationPath()
    
    init() {
        Task {
            let config = RPConfig(address: "127.0.0.1", port: 50051)
            try await RenderProtocol.initialize(with: config)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationPath) {
                ContentView()
            }
        }
    }
}
