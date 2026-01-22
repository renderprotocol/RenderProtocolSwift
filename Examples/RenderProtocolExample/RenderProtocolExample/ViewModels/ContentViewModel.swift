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
    
    @ObservationIgnored let rp = RenderProtocol()
    
    func fetchView() {
        Task {
            do {
                self.widget = try await rp.dryRun()
                debugPrint("----->>> View Fetched!")
            } catch {
                debugPrint("----->>> \(error)")
            }
        }
    }
}
