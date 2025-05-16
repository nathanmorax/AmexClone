//
//  UIImage+Extensions.swift
//  AmexClone
//
//  Created by Jonathan Mora on 12/04/25.
//

import SwiftUI

extension Image {
    enum SymbolSize {
        case small, medium, large
    }
    
    func resizableSymbolImage(size: SymbolSize = .medium, color: Color = Colors.blueSymbol) -> some View {
        let font: Font
        switch size {
        case .small:
            font = .caption
        case .medium:
            font = .title3
        case .large:
            font = .largeTitle
        }

        return self
            .renderingMode(.template) 
            .symbolRenderingMode(.hierarchical)
            .font(font)
            .tint(color)
            .foregroundStyle(color)
    }
}


