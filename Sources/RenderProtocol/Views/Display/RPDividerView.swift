//
//  RPDividerView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPDividerView: View {
    let divider: RPDivider
    
    public var body: some View {
        let color = divider.hasColor ? divider.color.swiftUIColor : RPConstants.defaultBackgroundColor
        let thickness = divider.hasThickness ? CGFloat(divider.thickness) : 1.0
        
        Rectangle()
            .fill(color)
            .frame(height: thickness)
            .padding(divider.hasIndent ? divider.indent.swiftUIEdgeInsets : EdgeInsets())
    }
}
