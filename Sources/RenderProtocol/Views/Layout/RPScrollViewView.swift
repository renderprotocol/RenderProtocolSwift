//
//  RPScrollViewView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPScrollViewView: View {
    let scrollView: RPScrollView

    public var body: some View {
        ScrollView(scrollView.axis.swiftUIAxis, showsIndicators: scrollView.showsIndicators) {
            if scrollView.hasChild {
                RPWidgetView(widget: scrollView.child)
            }
        }
    }
}
