//
//  RPManager.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation

internal protocol RPManager: RPRegisterable {}

extension RPManager {
    func didRegister() async throws {}
    func willUnregister() async throws {}
}
