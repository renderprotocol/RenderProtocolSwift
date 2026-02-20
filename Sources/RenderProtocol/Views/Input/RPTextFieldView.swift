//
//  RPTextFieldView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

#if canImport(UIKit)
import UIKit
#endif

public struct RPTextFieldView: View {
    let textField: RPTextField

    @State private var text: String = ""

    public var body: some View {
        let initialValue = textField.hasInitialValue ? textField.initialValue : ""

        Group {
            if textField.secureEntry {
                SecureField(textField.hasPlaceholder ? textField.placeholder : "", text: $text)
            } else {
                TextField(textField.hasPlaceholder ? textField.placeholder : "", text: $text)
                    #if canImport(UIKit)
                    .keyboardType(textField.keyboardType.uiKeyboardType)
                    #endif
            }
        }
        .disabled(!textField.enabled)
        .onAppear {
            if text.isEmpty {
                text = initialValue
            }
        }
        .onSubmit {
            if textField.hasOnSubmit {
                RPActionHandler.handle(textField.onSubmit)
            }
        }
    }
}
