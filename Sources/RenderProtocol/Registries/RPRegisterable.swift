//
//  RPRegisterable.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation

public protocol RPRegisterable: Actor, Sendable {
    var id: String { get }
    
    func didRegister() async throws
    func willUnregister() async throws
}
