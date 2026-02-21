//
//  RPWidgetView.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import Foundation
import RPGeneratedSwift
import SwiftUI

public struct RPWidgetView: View {
    let widget: RPWidget
    
    public init(widget: RPWidget) {
        self.widget = widget
    }
    
    public var body: some View {
        switch widget.content {
            
            // ── Layout (51–69) ──────────────────────────────────
        case .row(let row): RPRowView(row: row)
        case .column(let column): RPColumnView(column: column)
        case .stack(let stack): RPStackView(stack: stack)
        case .scrollable(let scrollable): RPScrollableView(scrollable: scrollable)
        case .lazyList(let lazyList): RPLazyListView(lazyList: lazyList)
        case .lazyGrid(let lazyGrid): RPLazyGridView(lazyGrid: lazyGrid)
        case .wrap(let wrap): RPWrapView(wrap: wrap)
        case .center(let center): RPCenterView(center: center)
        case .expanded(let expanded): RPExpandedView(expanded: expanded)
            
            // ── Modifiers (70–89) ───────────────────────────────
        case .padding(let padding): RPPaddingView(padding: padding)
        case .background(let background): RPBackgroundView(background: background)
        case .border(let border): RPBorderView(border: border)
        case .clip(let clip): RPClipView(clip: clip)
        case .opacity(let opacity): RPOpacityView(opacity: opacity)
        case .visibility(let visibility): RPVisibilityView(visibility: visibility)
        case .shadow(let shadow): RPShadowView(shadow: shadow)
        case .sizeBox(let sizeBox): RPSizeBoxView(sizeBox: sizeBox)
        case .safeArea(let safeArea): RPSafeAreaView(safeArea: safeArea)
        case .aspectRatio(let aspectRatio): RPAspectRatioView(aspectRatio: aspectRatio)
        case .positioned(let positioned): RPPositionedView(positioned: positioned)
            
            // ── Display (101–149) ───────────────────────────────
        case .text(let text): RPTextView(text: text)
        case .image(let image): RPImageView(image: image)
        case .icon(let icon): RPIconView(icon: icon)
        case .spacer(let spacer): RPSpacerView(spacer: spacer)
        case .divider(let divider): RPDividerView(divider: divider)
        case .progressIndicator(let pi): RPProgressIndicatorView(progressIndicator: pi)
        case .button(let button): RPButtonView(button: button)
            
            // ── Input (150–179) ─────────────────────────────────
        case .textField(let textField): RPTextFieldView(textField: textField)
        case .toggle(let toggle): RPToggleView(toggle: toggle)
        case .slider(let slider): RPSliderView(slider: slider)
            
            // ── Composite (180–199) ─────────────────────────────
        case .card(let card): RPCardView(card: card)
        case .listTile(let listTile): RPListTileView(listTile: listTile)
        case .appBar(let appBar): RPAppBarView(appBar: appBar)
        case .bottomNavBar(let bottomNavBar): RPBottomNavBarView(bottomNavBar: bottomNavBar)
        case .badge(let badge): RPBadgeView(badge: badge)
        case .scaffold(let scaffold): RPScaffoldView(scaffold: scaffold)
            
            // ── Interactive (200–219) ───────────────────────────
        case .gestureDetector(let gd): RPGestureDetectorView(gestureDetector: gd)
            
        case .none: EmptyView()
        }
    }
}
