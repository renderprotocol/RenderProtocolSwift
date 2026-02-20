//
//  RPVisibilityView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPVisibilityView: View {
    let visibility: RPVisibility
    
    public var body: some View {
        if visibility.hasChild, visibility.visible {
            RPWidgetView(widget: visibility.child)
        } else { EmptyView() }
    }
}
