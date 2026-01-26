//
//  RPRenderTreeId.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 26/01/26.
//

import Foundation

public protocol RPRenderTreeId: RPPortable {
    var rawRPValue: String { get }
}

extension RPRenderTreeId {
    var id: String { rawRPValue }
}
