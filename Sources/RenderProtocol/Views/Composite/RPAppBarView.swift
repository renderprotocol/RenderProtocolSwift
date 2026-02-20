//
//  RPAppBarView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPAppBarView: View {
    let appBar: RPAppBar

    public var body: some View {
        HStack {
            if appBar.hasLeading {
                RPWidgetView(widget: appBar.leading)
            }

            Spacer()

            if appBar.hasTitle {
                RPWidgetView(widget: appBar.title)
            }

            Spacer()

            ForEach(appBar.actions) { action in
                RPWidgetView(widget: action)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(appBar.hasBackgroundColor ? appBar.backgroundColor.swiftUIColor : RPConstants.defaultBackgroundColor)
    }
}
