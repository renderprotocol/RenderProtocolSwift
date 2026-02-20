//
//  RPToggleView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPToggleView: View {
    let toggle: RPToggle
    
    @State private var isOn: Bool = false
    
    public var body: some View {
        Toggle(isOn: $isOn) {
            if toggle.hasLabel {
                RPWidgetView(widget: toggle.label)
            }
        }
        .disabled(!toggle.enabled)
        .tint(toggle.hasOnColor ? toggle.onColor.swiftUIColor : nil)
        .onAppear {
            isOn = toggle.initialValue
        }
        .onChange(of: isOn) {
            if toggle.hasOnChange {
                RPActionHandler.handle(toggle.onChange)
            }
        }
    }
}
