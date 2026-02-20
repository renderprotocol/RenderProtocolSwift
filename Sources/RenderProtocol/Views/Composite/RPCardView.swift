//
//  RPCardView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPCardView: View {
    let card: RPCard
    
    public var body: some View {
        if card.hasChild {
            let defaultInsets = EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
            
            RPWidgetView(widget: card.child)
                .padding(card.hasPadding ? card.padding.swiftUIEdgeInsets : defaultInsets)
                .background(card.hasBackgroundColor ? card.backgroundColor.swiftUIColor : RPConstants.defaultBackgroundColor)
                .cornerRadius(card.hasCornerRadius ? CGFloat(card.cornerRadius) : 12)
                .shadow(
                    color: Color.black.opacity(0.15),
                    radius: card.hasElevation ? CGFloat(card.elevation) : 4,
                    x: 0,
                    y: card.hasElevation ? CGFloat(card.elevation / 2) : 2
                )
        } else { EmptyView() }
    }
}
