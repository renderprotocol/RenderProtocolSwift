//
//  RPStackView.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import RPGeneratedSwift
import SwiftUI

public struct RPStackView: View {
    let stack: RPStack
    public var body: some View {
        ZStack {
            ForEach(stack.children) { RPWidgetView(widget: $0) }
        }
    }
}
