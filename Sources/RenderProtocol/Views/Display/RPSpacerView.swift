//
//  RPSpacerView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPSpacerView: View {
    let spacer: RPSpacer

    public var body: some View {
        Spacer(minLength: spacer.hasMinLength ? CGFloat(spacer.minLength) : nil)
    }
}
