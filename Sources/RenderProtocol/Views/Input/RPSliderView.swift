//
//  RPSliderView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPSliderView: View {
    let slider: RPSlider

    @State private var value: Double = 0

    public var body: some View {
        let minValue = Double(slider.minValue)
        let maxValue = Double(slider.maxValue)
        let step = slider.hasStep ? Double(slider.step) : nil

        Group {
            if let step {
                Slider(value: $value, in: minValue...maxValue, step: step)
            } else {
                Slider(value: $value, in: minValue...maxValue)
            }
        }
        .disabled(!slider.enabled)
        .tint(slider.hasActiveColor ? slider.activeColor.swiftUIColor : nil)
        .onAppear {
            value = slider.hasInitialValue ? Double(slider.initialValue) : minValue
        }
        .onChange(of: value) {
            if slider.hasOnChange {
                RPActionHandler.handle(slider.onChange)
            }
        }
    }
}
