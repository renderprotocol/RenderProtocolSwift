//
//  RPPositionedView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPPositionedView: View {
    let positioned: RPPositioned
    
    public var body: some View {
        if positioned.hasChild {
            RPWidgetView(widget: positioned.child)
                .padding(.top, positioned.hasTop ? CGFloat(positioned.top) : 0)
                .padding(.bottom, positioned.hasBottom ? CGFloat(positioned.bottom) : 0)
                .padding(.leading, positioned.hasLeading ? CGFloat(positioned.leading) : 0)
                .padding(.trailing, positioned.hasTrailing ? CGFloat(positioned.trailing) : 0)
        } else { EmptyView() }
    }
}
