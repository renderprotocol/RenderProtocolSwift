//
//  RPOpacityView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPOpacityView: View {
    let opacity: RPOpacity
    
    public var body: some View {
        if opacity.hasChild {
            RPWidgetView(widget: opacity.child)
                .opacity(Double(opacity.value))
        } else { EmptyView() }
    }
}
