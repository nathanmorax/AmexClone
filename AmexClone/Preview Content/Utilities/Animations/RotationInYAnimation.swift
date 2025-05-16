//
//  Rotation.swift
//  AmexClone
//
//  Created by Jonathan Mora on 12/04/25.
//

import SwiftUI


struct RotateInYOnAppearModifier: ViewModifier {
    @State private var angle: Double = 0

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(.degrees(angle), axis: (x: 0, y: 1, z: 0))
            .onAppear {
                withAnimation(.easeInOut(duration: 0.5)) {
                    angle -= 180
                }
            }
    }
}

extension View {
    func rotateInYOnAppear() -> some View {
        self.modifier(RotateInYOnAppearModifier())
    }
}

