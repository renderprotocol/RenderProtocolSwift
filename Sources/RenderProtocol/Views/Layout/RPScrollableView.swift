//
//  RPScrollableView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPScrollableView: View {
    let scrollView: RPScrollable

    public var body: some View {
        ScrollView(scrollView.axis.swiftUIAxis, showsIndicators: scrollView.showsIndicators) {
            if scrollView.hasChild {
                RPWidgetView(widget: scrollView.child)
            }
        }
    }
}
