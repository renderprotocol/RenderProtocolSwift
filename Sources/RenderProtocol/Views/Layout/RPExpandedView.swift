//
//  RPExpandedView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPExpandedView: View {
    let expanded: RPExpanded
    
    public var body: some View {
        if expanded.hasChild {
            RPWidgetView(widget: expanded.child)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else { EmptyView() }
    }
}
