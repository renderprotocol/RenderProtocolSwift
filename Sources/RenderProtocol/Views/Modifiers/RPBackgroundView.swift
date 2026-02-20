//
//  RPBackgroundView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPBackgroundView: View {
    let background: RPBackground
    
    public var body: some View {
        if background.hasChild {
            RPWidgetView(widget: background.child)
                .background(background.hasColor ? background.color.swiftUIColor : Color.clear)
        } else { EmptyView() }
    }
}
