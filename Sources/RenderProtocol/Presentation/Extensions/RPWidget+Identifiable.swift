//
//  RPWidget+Identifiable.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import Foundation
import RPGeneratedSwift

extension RPWidget: @retroactive Identifiable {
    static func withID(_ id: UUID = .init()) -> RPWidget {
        var widget = RPWidget()
        widget.id = id.uuidString
        return widget
    }
}
