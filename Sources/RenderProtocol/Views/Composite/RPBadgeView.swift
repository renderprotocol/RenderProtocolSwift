//
//  RPBadgeView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPBadgeView: View {
    let badge: RPBadge
    
    public var body: some View {
        if badge.hasChild {
            let badgeColor = badge.hasColor ? badge.color.swiftUIColor : Color.red
            
            RPWidgetView(widget: badge.child)
                .overlay(alignment: .topTrailing) {
                    if badge.hasValue {
                        Text(badge.value)
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(badgeColor)
                            .clipShape(Capsule())
                            .offset(x: 8, y: -8)
                    } else {
                        Circle()
                            .fill(badgeColor)
                            .frame(width: 10, height: 10)
                            .offset(x: 4, y: -4)
                    }
                }
        }
    }
}
