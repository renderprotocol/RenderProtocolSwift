//
//  RPScrollableView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPScrollableView: View {
    let scrollable: RPScrollable
    
    public var body: some View {
        ScrollView(scrollable.axis.swiftUIAxis, showsIndicators: scrollable.showsIndicators) {
            if scrollable.hasChild {
                RPWidgetView(widget: scrollable.child)
            }
        }
    }
}
