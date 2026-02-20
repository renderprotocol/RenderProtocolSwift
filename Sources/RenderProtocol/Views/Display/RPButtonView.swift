//
//  RPButtonView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPButtonView: View {
    let button: RPButton

    public var body: some View {
        Button {
            // Action handling is delegated to the action system
            RPActionHandler.handle(button.action)
        } label: {
            if button.hasLabel {
                RPWidgetView(widget: button.label)
            }
        }
        .disabled(button.disabled)
        .buttonStyle(RPButtonStyleRepresentable(style: button.style))
    }
}

// MARK: - Custom Button Style

private struct RPButtonStyleRepresentable: SwiftUI.ButtonStyle {
    let style: RPButtonStyle

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .foregroundColor(style.foregroundColor)
            .background(style.backgroundColor)
            .cornerRadius(8)
            .overlay(
                Group {
                    if style.hasBorder {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor, lineWidth: 1)
                    }
                }
            )
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

// MARK: - Action Handler (placeholder)

enum RPActionHandler {
    static func handle(_ action: RPAction) {
        // Action handling will be wired through the plugin system.
        // This is a placeholder that can be extended by registering
        // an action handler plugin via RenderProtocol.register(plugin:).
    }
}
