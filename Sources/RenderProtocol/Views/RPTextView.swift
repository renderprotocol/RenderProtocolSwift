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
        Text(text.value)
    }
}
