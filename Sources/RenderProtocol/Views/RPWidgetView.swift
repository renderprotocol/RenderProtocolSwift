//
//  RPWidgetView.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import Foundation
import RPGeneratedSwift
import SwiftUI

public struct RPWidgetView: View {
    let widget: RPWidget
    
    public init(widget: RPWidget) {
        self.widget = widget
    }
    
    public var body: some View {
        switch widget.content {
        case .row(let row): RPRowView(row: row)
        case .column(let column): RPColumnView(column: column)
        case .stack(let stack): RPStackView(stack: stack)
        case .text(let text): RPTextView(text: text)
        case .image(let image): RPImageView(image: image)
        case .none: EmptyView()
        }
    }
}
