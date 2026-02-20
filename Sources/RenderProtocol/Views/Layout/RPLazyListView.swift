//
//  RPLazyListView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPLazyListView: View {
    let lazyList: RPLazyList
    
    public var body: some View {
        let spacing = lazyList.spacing > 0 ? CGFloat(lazyList.spacing) : nil
        
        ScrollView(lazyList.axis.swiftUIAxis, showsIndicators: lazyList.showsIndicators) {
            if lazyList.axis == .horizontal {
                LazyHStack(spacing: spacing) {
                    ForEach(Array(lazyList.children.enumerated()), id: \.element.id) { index, child in
                        RPWidgetView(widget: child)
                        
                        if lazyList.hasSeparator && index < lazyList.children.count - 1 {
                            RPWidgetView(widget: lazyList.separator)
                        }
                    }
                }
            } else {
                LazyVStack(spacing: spacing) {
                    ForEach(Array(lazyList.children.enumerated()), id: \.element.id) { index, child in
                        RPWidgetView(widget: child)
                        
                        if lazyList.hasSeparator && index < lazyList.children.count - 1 {
                            RPWidgetView(widget: lazyList.separator)
                        }
                    }
                }
            }
        }
    }
}
