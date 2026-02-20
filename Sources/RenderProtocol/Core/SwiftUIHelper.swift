//
//  SwiftUIHelper.swift
//  RenderProtocolSwift
//
//  SwiftUI conversion helpers for generated proto types.
//

import RPGeneratedSwift
import SwiftUI

// MARK: - RPColor → SwiftUI.Color

public extension RPColor {
    var swiftUIColor: Color {
        Color(
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            opacity: hasOpacity ? Double(opacity) : 1.0
        )
    }
}

// MARK: - RPAlignment → SwiftUI.Alignment

public extension RPAlignment {
    var swiftUIAlignment: Alignment {
        switch self {
        case .top: return .top
        case .bottom: return .bottom
        case .leading: return .leading
        case .trailing: return .trailing
        case .topLeading: return .topLeading
        case .topTrailing: return .topTrailing
        case .bottomLeading: return .bottomLeading
        case .bottomTrailing: return .bottomTrailing
        case .center, .unspecified, .UNRECOGNIZED: return .center
        }
    }
}

// MARK: - RPAxisAlignment → SwiftUI.HorizontalAlignment / VerticalAlignment

public extension RPAxisAlignment {
    var horizontalAlignment: HorizontalAlignment {
        switch self {
        case .leading: return .leading
        case .trailing: return .trailing
        case .center, .unspecified, .spaceBetween, .spaceEvenly: return .center
        case .UNRECOGNIZED: return .center
        }
    }
    
    var verticalAlignment: VerticalAlignment {
        switch self {
        case .leading: return .top
        case .trailing: return .bottom
        case .center, .unspecified, .spaceBetween, .spaceEvenly: return .center
        case .UNRECOGNIZED: return .center
        }
    }
}

// MARK: - RPContentMode → SwiftUI.ContentMode

public extension RPContentMode {
    var swiftUIContentMode: SwiftUI.ContentMode {
        switch self {
        case .fit, .unspecified: return .fit
        case .fill: return .fill
        case .stretch, .none: return .fill
        case .UNRECOGNIZED: return .fit
        }
    }
}

// MARK: - RPFontWeight → SwiftUI.Font.Weight

public extension RPFontWeight {
    var swiftUIFontWeight: Font.Weight {
        switch self {
        case .thin: return .thin
        case .extraLight: return .ultraLight
        case .light: return .light
        case .regular, .unspecified: return .regular
        case .medium: return .medium
        case .semiBold: return .semibold
        case .bold: return .bold
        case .extraBold: return .heavy
        case .black: return .black
        case .UNRECOGNIZED: return .regular
        }
    }
}

// MARK: - RPTextAlignment → SwiftUI.TextAlignment

public extension RPTextAlignment {
    var swiftUITextAlignment: SwiftUI.TextAlignment {
        switch self {
        case .left: return .leading
        case .center, .unspecified: return .center
        case .right: return .trailing
        case .justify: return .leading
        case .UNRECOGNIZED: return .center
        }
    }
}

// MARK: - RPAxis → SwiftUI.Axis

public extension RPAxis {
    var swiftUIAxis: Axis.Set {
        switch self {
        case .horizontal: return .horizontal
        case .vertical, .unspecified: return .vertical
        case .UNRECOGNIZED: return .vertical
        }
    }
}

// MARK: - RPTextStyle → SwiftUI.Font

public extension RPTextStyle {
    var swiftUIFont: Font {
        var font: Font
        
        if hasFontSize {
            font = .system(size: CGFloat(fontSize))
        } else {
            font = .body
        }
        
        if fontWeight != .unspecified {
            font = font.weight(fontWeight.swiftUIFontWeight)
        }
        
        if fontStyle == .italic {
            font = font.italic()
        }
        
        return font
    }
}

// MARK: - RPButtonStyle → Button styling

public extension RPButtonStyle {
    var foregroundColor: Color {
        switch self {
        case .primary, .unspecified: return .white
        case .secondary: return .primary
        case .text: return .accentColor
        case .outlined: return .accentColor
        case .destructive: return .white
        case .UNRECOGNIZED: return .white
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .primary, .unspecified: return .accentColor
        case .secondary: return Color(.systemGray)
        case .text: return .clear
        case .outlined: return .clear
        case .destructive: return .red
        case .UNRECOGNIZED: return .accentColor
        }
    }
    
    var hasBorder: Bool {
        self == .outlined
    }
}

// MARK: - RPEdgeInsets → SwiftUI.EdgeInsets

public extension RPEdgeInsets {
    var swiftUIEdgeInsets: EdgeInsets {
        EdgeInsets(
            top: CGFloat(top),
            leading: CGFloat(leading),
            bottom: CGFloat(bottom),
            trailing: CGFloat(trailing)
        )
    }
}

// MARK: - RPKeyboardType → UIKit

#if canImport(UIKit)
import UIKit

public extension RPKeyboardType {
    var uiKeyboardType: UIKeyboardType {
        switch self {
        case .default, .unspecified: return .default
        case .email: return .emailAddress
        case .number: return .numberPad
        case .phone: return .phonePad
        case .url: return .URL
        case .decimal: return .decimalPad
        case .UNRECOGNIZED: return .default
        }
    }
}
#endif
