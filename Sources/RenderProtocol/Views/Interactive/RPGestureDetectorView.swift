//
//  RPGestureDetectorView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPGestureDetectorView: View {
    let gestureDetector: RPGestureDetector

    public var body: some View {
        if gestureDetector.hasChild {
            RPWidgetView(widget: gestureDetector.child)
                .contentShape(Rectangle())
                .onTapGesture {
                    if gestureDetector.hasOnTap {
                        RPActionHandler.handle(gestureDetector.onTap)
                    }
                }
                .onLongPressGesture {
                    if gestureDetector.hasOnLongPress {
                        RPActionHandler.handle(gestureDetector.onLongPress)
                    }
                }
                .simultaneousGesture(
                    TapGesture(count: 2)
                        .onEnded {
                            if gestureDetector.hasOnDoubleTap {
                                RPActionHandler.handle(gestureDetector.onDoubleTap)
                            }
                        }
                )
        } else { EmptyView() }
    }
}
