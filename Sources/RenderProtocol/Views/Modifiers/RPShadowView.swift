//
//  RPShadowView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPShadowView: View {
    let shadow: RPShadow
    
    public var body: some View {
        if shadow.hasChild {
            RPWidgetView(widget: shadow.child)
                .shadow(
                    color: shadow.hasColor ? shadow.color.swiftUIColor : Color.black.opacity(0.33),
                    radius: CGFloat(shadow.radius),
                    x: CGFloat(shadow.offsetX),
                    y: CGFloat(shadow.offsetY)
                )
        } else { EmptyView() }
    }
}
