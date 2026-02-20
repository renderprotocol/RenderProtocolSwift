//
//  RPBorderView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPBorderView: View {
    let border: RPBorder
    
    public var body: some View {
        if border.hasChild {
            let color = border.hasColor ? border.color.swiftUIColor : Color.primary
            let lineWidth = CGFloat(border.width)
            
            if border.hasRadius {
                RPWidgetView(widget: border.child)
                    .overlay(
                        RoundedRectangle(cornerRadius: CGFloat(border.radius))
                            .stroke(color, lineWidth: lineWidth)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: CGFloat(border.radius)))
            } else {
                RPWidgetView(widget: border.child)
                    .border(color, width: lineWidth)
            }
        } else { EmptyView() }
    }
}
