//
//  RPRowView.swift
//  RenderProtocolSwift
//
//  Created by Arindam Karmakar on 21/01/26.
//

import RPGeneratedSwift
import SwiftUI

public struct RPRowView: View {
    let row: RPRow
    
    public var body: some View {
        let spacing = row.spacing > 0 ? CGFloat(row.spacing) : nil
        
        HStack(alignment: row.alignment.verticalAlignment, spacing: spacing) {
            ForEach(row.children) { RPWidgetView(widget: $0) }
        }
    }
}
