//
//  RPError.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation

public enum RPError: String, LocalizedError, RPPortableEnum {
    case notInitialized
    
    public var id: String { rawValue }
    
    public var localizedDescription: String {
        switch self {
        case .notInitialized:
            return "RenderProtocol not initialized, call `RenderProtocol.initialize(with:)` first."
        }
    }
}
