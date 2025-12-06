//
//  ContentView.swift
//  RenderProtocolExample
//
//  Created by Arindam Karmakar on 07/12/25.
//

import SwiftUI
import RenderProtocol

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
