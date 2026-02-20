//
//  RPBottomNavBarView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPBottomNavBarView: View {
    let bottomNavBar: RPBottomNavBar
    
    @State private var selectedIndex: Int = 0
    
    public var body: some View {
        let selectedColor = bottomNavBar.hasSelectedColor ? bottomNavBar.selectedColor.swiftUIColor : Color.accentColor
        let unselectedColor = bottomNavBar.hasUnselectedColor ? bottomNavBar.unselectedColor.swiftUIColor : Color.gray
        
        HStack {
            ForEach(Array(bottomNavBar.items.enumerated()), id: \.offset) { index, item in
                Button {
                    selectedIndex = index
                    RPActionHandler.handle(item.action)
                } label: {
                    VStack(spacing: 4) {
                        Image(systemName: item.icon.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        
                        if item.hasLabel {
                            Text(item.label)
                                .font(.caption2)
                        }
                    }
                    .foregroundColor(index == selectedIndex ? selectedColor : unselectedColor)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 8)
        .background(bottomNavBar.hasBackgroundColor ? bottomNavBar.backgroundColor.swiftUIColor : RPConstants.defaultBackgroundColor)
        .onAppear {
            selectedIndex = bottomNavBar.hasSelectedIndex ? Int(bottomNavBar.selectedIndex) : 0
        }
    }
}
