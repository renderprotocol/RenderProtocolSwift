//
//  RPTextView.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import RPGeneratedSwift
import SwiftUI

public struct RPTextView: View {
    let text: RPText

    public var body: some View {
        var swiftUIText = Text(text.value)

        if text.hasStyle {
            swiftUIText = swiftUIText.font(text.style.swiftUIFont)

            if text.style.hasColor {
                swiftUIText = swiftUIText.foregroundColor(text.style.color.swiftUIColor)
            }

            if text.style.decoration == .underline {
                swiftUIText = swiftUIText.underline()
            } else if text.style.decoration == .lineThrough {
                swiftUIText = swiftUIText.strikethrough()
            }

            if text.style.hasLetterSpacing {
                swiftUIText = swiftUIText.tracking(CGFloat(text.style.letterSpacing))
            }
        }

        return swiftUIText
            .lineLimit(text.hasMaxLines ? Int(text.maxLines) : nil)
            .truncationMode(text.overflow == .ellipsis ? .tail : .tail)
            .multilineTextAlignment(text.textAlignment.swiftUITextAlignment)
    }
}
