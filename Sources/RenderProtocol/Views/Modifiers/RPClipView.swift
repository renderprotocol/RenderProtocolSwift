//
//  RPClipView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPClipView: View {
    let clip: RPClip
    
    @ViewBuilder
    public var body: some View {
        if clip.hasChild {
            if clip.hasShape {
                switch clip.shape.value {
                case .rectangle:
                    RPWidgetView(widget: clip.child)
                        .clipShape(Rectangle())
                case .circle:
                    RPWidgetView(widget: clip.child)
                        .clipShape(Circle())
                case .ellipse:
                    RPWidgetView(widget: clip.child)
                        .clipShape(Ellipse())
                case .capsule:
                    RPWidgetView(widget: clip.child)
                        .clipShape(Capsule())
                case .roundedRectangle(let rr):
                    RPWidgetView(widget: clip.child)
                        .clipShape(RoundedRectangle(cornerRadius: CGFloat(rr.radius)))
                case .none:
                    RPWidgetView(widget: clip.child)
                        .clipped()
                }
            } else {
                RPWidgetView(widget: clip.child)
                    .clipped()
            }
        } else { EmptyView() }
    }
}
