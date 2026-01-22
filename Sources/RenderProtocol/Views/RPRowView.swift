//
//  RPRowView.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import RPGeneratedSwift
import SwiftUI

public struct RPRowView: View {
    let row: RPRow
    public var body: some View {
        HStack {
            ForEach(row.children) { RPWidgetView(widget: $0) }
        }
    }
}
