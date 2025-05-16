//
//  UIButton+Extensions.swift
//  AmexClone
//
//  Created by Jonathan Mora on 12/04/25.
//

import SwiftUI

extension Button {
    func pramryButtonBlue() -> some View {
        self
            .padding()
            .foregroundStyle(.white)
            .bold()
            .background(Colors.blueButton)
            .cornerRadius(8)
    }
}

