//
//  RPPlugin.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation
import RPGeneratedSwift

public protocol RPPlugin: RPRegisterable {
    func didRequest<Id: RPRenderTreeId>(renderTreeWithId id: Id)
    func didReceive<Id: RPRenderTreeId>(renderTree: RPWidget, withId id: Id)
    func didRequestDebugOverlayVisibilityChange(to visible: Bool)
}

extension RPPlugin {
    func didRequest<Id: RPRenderTreeId>(renderTreeWithId id: Id) {}
    func didReceive<Id: RPRenderTreeId>(renderTree: RPWidget, withId id: Id) {}
    func didRequestDebugOverlayVisibilityChange(to visible: Bool) {}
}
