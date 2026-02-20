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
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let loadedImage):
                    loadedImage
                        .resizable()
                        .aspectRatio(contentMode: image.contentMode.swiftUIContentMode)
                case .failure:
                    placeholderView
                case .empty:
                    ProgressView()
                @unknown default:
                    placeholderView
                }
            }
            .frame(
                width: image.hasWidth ? CGFloat(image.width) : nil,
                height: image.hasHeight ? CGFloat(image.height) : nil
            )
            .accessibilityLabel(image.hasAltText ? image.altText : "")
        } else {
            placeholderView
        }
    }

    @ViewBuilder
    private var placeholderView: some View {
        if let placeholderURLString = image.hasPlaceholderURL ? image.placeholderURL : nil,
           let placeholderURL = URL(string: placeholderURLString) {
            AsyncImage(url: placeholderURL) { phase in
                if case .success(let img) = phase {
                    img.resizable().aspectRatio(contentMode: .fit)
                } else {
                    defaultPlaceholder
                }
            }
        } else {
            defaultPlaceholder
        }
    }

    private var defaultPlaceholder: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.secondary)
            .frame(
                width: image.hasWidth ? CGFloat(image.width) : nil,
                height: image.hasHeight ? CGFloat(image.height) : nil
            )
    }
}
