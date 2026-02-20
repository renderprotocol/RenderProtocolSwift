//
//  RPListTileView.swift
//  RenderProtocolSwift
//

import RPGeneratedSwift
import SwiftUI

public struct RPListTileView: View {
    let listTile: RPListTile

    public var body: some View {
        let content = HStack(spacing: 12) {
            if listTile.hasLeading {
                RPWidgetView(widget: listTile.leading)
            }

            VStack(alignment: .leading, spacing: 2) {
                RPWidgetView(widget: listTile.title)

                if listTile.hasSubtitle {
                    RPWidgetView(widget: listTile.subtitle)
                }
            }

            Spacer()

            if listTile.hasTrailing {
                RPWidgetView(widget: listTile.trailing)
            }
        }
        .contentShape(Rectangle())

        if listTile.hasOnTap {
            Button {
                RPActionHandler.handle(listTile.onTap)
            } label: {
                content
            }
            .buttonStyle(.plain)
        } else {
            content
        }
    }
}
