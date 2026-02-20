//
//  RPConstants.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation
import SwiftUI

internal enum RPConstants {
    static let cacheManagerID: String = "renderprotocol.cache_manager"
    static let networkManagerID: String = "renderprotocol.network_manager"
    
    static var defaultBackgroundColor: Color {
        #if os(macOS)
        return Color(.windowBackgroundColor)
        #else
        return Color(.systemBackground)
        #endif
    }
}
