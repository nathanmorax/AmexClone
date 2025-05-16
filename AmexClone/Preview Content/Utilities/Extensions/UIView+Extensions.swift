//
//  UIView+Extensions.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI

struct BoxBackgroundModifier: ViewModifier {
    let color: Color
    let boxCornerRadius: CGFloat = 8
    let boxShadowCorner: CGFloat = 15
    let shadowY: CGFloat = 5
    let opacity: Double = 0.2
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: boxCornerRadius)
                    .foregroundStyle(color)
                    .shadow(color: .black.opacity(opacity), radius: boxShadowCorner, x: 0, y: shadowY)
                    .frame(maxWidth: .infinity)
            )
    }
}

struct DividerCustom: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 0.2)
            .frame(maxWidth: .infinity)
            .background(Color.gray)
    }
}


extension View {
    func boxBackground(color: Color) -> some View {
        self.modifier(BoxBackgroundModifier(color: color))
    }
    
    func sectionBoxBackground() -> some View {
        self.boxBackground(color: Colors.section)
    }
    
    func secondaryBoxBackground() -> some View {
        self.boxBackground(color: Colors.blue1)
    }
    
    func customDivider() -> some View {
        self.modifier(DividerCustom())
    }
    
}
