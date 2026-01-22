//
//  ContentView.swift
//  RenderProtocolExample
//
//  Created by Arindam Karmakar on 07/12/25.
//

import SwiftUI
import RenderProtocol

struct ContentView: View {
    @State private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            if let widget = viewModel.widget {
                RPWidgetView(widget: widget)
            }
            Spacer()
            Button("Fetch View", action: viewModel.fetchView)
                .buttonStyle(.glassProminent)
        }
        .padding()
        .navigationTitle("Render Protocol")
    }
}

#Preview {
    ContentView()
}
