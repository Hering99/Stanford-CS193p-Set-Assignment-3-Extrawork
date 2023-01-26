//
//  Stripes.swift
//  Set.Extrawork
//
//  Created by Lukas Hering on 21.12.22.
//

import SwiftUI

//oval shape
struct StripeView<SymbolShape>: View where SymbolShape: Shape {
    let numberOfStripes: Int = 8
    let borderLineWidth: CGFloat = 1.3
    
    let shape: SymbolShape
    let color: Color
    let spacingColor = Color.white
    
    var body: some View {
        VStack(spacing: 0.5) {
            ForEach(0..<numberOfStripes, id: \.self) {_ in
                spacingColor
                color
            }
            spacingColor
        }
        .mask(shape)
        .overlay(shape.stroke(color, lineWidth: borderLineWidth))
    }
}
