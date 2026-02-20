//
//  ContentView.swift
//  RenderProtocolExample
//
//  Created by Arindam Karmakar on 07/12/25.
//

import SwiftUI
import RenderProtocol
import RPGeneratedSwift

struct ContentView: View {
    @State private var widget: RPWidget?
    
    private func fetchView() {
        Task {
            do {
                self.widget = try await RenderProtocol.fetchRenderTree(with: "")
                debugPrint("----->>> View Fetched!")
            } catch {
                debugPrint("----->>> \(error)")
            }
        }
    }
    
    var body: some View {
        VStack {
            if let widget { RPWidgetView(widget: widget) }
            Spacer()
            Button("Fetch View", action: fetchView)
                .buttonStyle(.glassProminent)
        }
        .navigationTitle("Render Protocol")
        .task {
            let config = RPConfig(address: "127.0.0.1", port: 50051)
            try? await RenderProtocol.initialize(with: config)
        }
    }
}

#Preview {
    ContentView()
}
