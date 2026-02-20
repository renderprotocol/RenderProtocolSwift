//
//  RPPaddingView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPPaddingView: View {
    let padding: RPPadding
    
    public var body: some View {
        if padding.hasChild {
            switch padding.value {
            case .all(let all):
                RPWidgetView(widget: padding.child)
                    .padding(CGFloat(all))
            case .symmetric(let sym):
                RPWidgetView(widget: padding.child)
                    .padding(.vertical, CGFloat(sym.vertical))
                    .padding(.horizontal, CGFloat(sym.horizontal))
            case .explicit(let exp):
                RPWidgetView(widget: padding.child)
                    .padding(EdgeInsets(
                        top: CGFloat(exp.top),
                        leading: CGFloat(exp.left),
                        bottom: CGFloat(exp.bottom),
                        trailing: CGFloat(exp.right)
                    ))
            case .none:
                RPWidgetView(widget: padding.child)
            }
        } else { EmptyView() }
    }
}
