//
//  RPPlugin.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation
import RPGeneratedSwift

public protocol RPPlugin: RPRegisterable {
    func didRequest(renderTreeWithId id: String)
    func didReceive(renderTree: RPWidget, withId id: String)
    func didRequestDebugOverlayVisibilityChange(to visible: Bool)
}

extension RPPlugin {
    func didRequest(renderTreeWithId id: String) {}
    func didReceive(renderTree: RPWidget, withId id: String) {}
    func didRequestDebugOverlayVisibilityChange(to visible: Bool) {}
}
