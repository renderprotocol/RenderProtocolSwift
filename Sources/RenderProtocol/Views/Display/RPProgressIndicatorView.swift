//
//  RPProgressIndicatorView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPProgressIndicatorView: View {
    let progressIndicator: RPProgressIndicator
    
    public var body: some View {
        let tintColor = progressIndicator.hasColor ? progressIndicator.color.swiftUIColor : nil
        
        Group {
            switch progressIndicator.type {
            case .circular, .unspecified, .UNRECOGNIZED:
                Group {
                    if progressIndicator.hasValue {
                        ProgressView(value: Double(progressIndicator.value))
                    } else {
                        ProgressView()
                    }
                }
                .progressViewStyle(.circular)
            case .linear:
                Group {
                    if progressIndicator.hasValue {
                        ProgressView(value: Double(progressIndicator.value))
                    } else {
                        ProgressView()
                    }
                }
                .progressViewStyle(.linear)
            }
        }
        .tint(tintColor)
    }
}
