//
//  RPImageView.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import RPGeneratedSwift
import SwiftUI

public struct RPImageView: View {
    let image: RPImage
    public var body: some View {
        if let url = URL(string: image.url) {
            AsyncImage(url: url)
        } else {
            EmptyView()
        }
    }
}
