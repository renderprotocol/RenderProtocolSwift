//
//  RenderProtocolExampleApp.swift
//  RenderProtocolExample
//
//  Created by Arindam Karmakar on 07/12/25.
//

import SwiftUI

@main
struct RenderProtocolExampleApp: App {
    @State var navigationPath = NavigationPath()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationPath) {
                ContentView()
            }
        }
    }
}
