//
//  RPColumnView.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import RPGeneratedSwift
import SwiftUI

public struct RPColumnView: View {
    let column: RPColumn
    public var body: some View {
        VStack {
            ForEach(column.children) { RPWidgetView(widget: $0) }
        }
    }
}
