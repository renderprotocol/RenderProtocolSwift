//
//  RPLazyGridView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPLazyGridView: View {
    let lazyGrid: RPLazyGrid
    
    public var body: some View {
        let spacing = lazyGrid.spacing > 0 ? CGFloat(lazyGrid.spacing) : nil
        
        LazyVGrid(columns: gridColumns, spacing: spacing) {
            ForEach(lazyGrid.children) { RPWidgetView(widget: $0) }
        }
    }
    
    private var gridColumns: [GridItem] {
        guard lazyGrid.hasLayout else {
            return [GridItem(.flexible())]
        }
        
        let runSpacing = lazyGrid.runSpacing > 0 ? CGFloat(lazyGrid.runSpacing) : nil
        
        switch lazyGrid.layout.value {
        case .fixed(let fixed):
            return Array(repeating: GridItem(.flexible(), spacing: runSpacing), count: Int(fixed.count))
        case .adaptive(let adaptive):
            return [GridItem(.adaptive(minimum: CGFloat(adaptive.minItemWidth)), spacing: runSpacing)]
        case .none:
            return [GridItem(.flexible())]
        }
    }
}
