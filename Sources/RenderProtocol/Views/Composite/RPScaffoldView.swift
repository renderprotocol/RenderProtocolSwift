//
//  RPScaffoldView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPScaffoldView: View {
    let scaffold: RPScaffold
    
    public var body: some View {
        VStack(spacing: 0) {
            if scaffold.hasAppBar {
                RPAppBarView(appBar: scaffold.appBar)
            }
            
            RPWidgetView(widget: scaffold.body)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            if scaffold.hasBottomNavBar {
                RPBottomNavBarView(bottomNavBar: scaffold.bottomNavBar)
            }
        }
        .background(scaffold.hasBackgroundColor ? scaffold.backgroundColor.swiftUIColor : RPConstants.defaultBackgroundColor)
    }
}
