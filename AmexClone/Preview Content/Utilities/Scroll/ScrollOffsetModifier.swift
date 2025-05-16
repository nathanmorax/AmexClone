//
//  ScrollOffsetModifier.swift
//  AmexClone
//
//  Created by Jonathan Mora on 12/04/25.
//
// MARK: - Collapsing Navigation Title

import SwiftUI

struct ScrollOffsetModifier: ViewModifier {
    let coordinateSpace: String
    let onScroll: (CGFloat) -> Void

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geo in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self,
                                    value: geo.frame(in: .named(coordinateSpace)).minY)
                }
            )
            .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: onScroll)
    }
}

extension View {
    func onScrollYChanged(in coordinateSpace: String = "scroll", perform: @escaping (CGFloat) -> Void) -> some View {
        self.modifier(ScrollOffsetModifier(coordinateSpace: coordinateSpace, onScroll: perform))
    }
}
