//
//  RPSizeBoxView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPSizeBoxView: View {
    let sizeBox: RPSizeBox
    
    public var body: some View {
        if sizeBox.hasChild {
            RPWidgetView(widget: sizeBox.child)
                .frame(
                    minWidth: sizeBox.hasMinWidth ? CGFloat(sizeBox.minWidth) : nil,
                    idealWidth: nil,
                    maxWidth: sizeBox.hasMaxWidth ? CGFloat(sizeBox.maxWidth) : nil,
                    minHeight: sizeBox.hasMinHeight ? CGFloat(sizeBox.minHeight) : nil,
                    idealHeight: nil,
                    maxHeight: sizeBox.hasMaxHeight ? CGFloat(sizeBox.maxHeight) : nil
                )
                .frame(
                    width: sizeBox.hasWidth ? CGFloat(sizeBox.width) : nil,
                    height: sizeBox.hasHeight ? CGFloat(sizeBox.height) : nil
                )
        } else { EmptyView() }
    }
}
