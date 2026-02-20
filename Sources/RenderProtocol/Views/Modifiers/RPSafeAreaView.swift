//
//  RPSafeAreaView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPSafeAreaView: View {
    let safeArea: RPSafeArea
    
    public var body: some View {
        if safeArea.hasChild {
            let edges = computeEdges()
            
            if edges.isEmpty {
                RPWidgetView(widget: safeArea.child)
                    .ignoresSafeArea()
            } else {
                RPWidgetView(widget: safeArea.child)
                    .safeAreaPadding(edges)
            }
        } else { EmptyView() }
    }
    
    private func computeEdges() -> Edge.Set {
        var edges: Edge.Set = []
        if safeArea.top { edges.insert(.top) }
        if safeArea.bottom { edges.insert(.bottom) }
        if safeArea.leading { edges.insert(.leading) }
        if safeArea.trailing { edges.insert(.trailing) }
        return edges
    }
}
