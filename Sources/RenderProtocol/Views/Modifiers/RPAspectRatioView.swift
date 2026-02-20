//
//  RPAspectRatioView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPAspectRatioView: View {
    let aspectRatio: RPAspectRatio
    
    public var body: some View {
        if aspectRatio.hasChild {
            RPWidgetView(widget: aspectRatio.child)
                .aspectRatio(
                    CGFloat(aspectRatio.ratio),
                    contentMode: aspectRatio.contentMode.swiftUIContentMode
                )
        } else { EmptyView() }
    }
}
