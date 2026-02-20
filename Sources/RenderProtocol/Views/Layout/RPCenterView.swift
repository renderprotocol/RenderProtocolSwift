//
//  RPCenterView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPCenterView: View {
    let center: RPCenter
    
    public var body: some View {
        if center.hasChild {
            RPWidgetView(widget: center.child)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        } else { EmptyView() }
    }
}
