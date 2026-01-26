//
//  ContentViewModel.swift
//  RenderProtocolExample
//
//  Created by Arindam Karmakar on 21/01/26.
//

import Foundation
import RenderProtocol
import RPGeneratedSwift

@MainActor @Observable internal final class ContentViewModel {
    var widget: RPWidget?
    
    func fetchView() {
        Task {
            do {
                self.widget = try await RenderProtocol.fetchRenderTree(with: "")
                debugPrint("----->>> View Fetched!")
            } catch {
                debugPrint("----->>> \(error)")
            }
        }
    }
}
