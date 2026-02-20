//
//  RPIconView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPIconView: View {
    let icon: RPIcon

    public var body: some View {
        let size = icon.hasSize ? CGFloat(icon.size) : 24.0
        let color = icon.hasColor ? icon.color.swiftUIColor : Color.primary

        Image(systemName: icon.name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size)
            .foregroundColor(color)
    }
}
