//
//  Colors.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI

struct Colors {
    static let background = Color(red: 1 / 255, green: 8 / 255, blue: 30 / 255)
    static let section = Color(red: 18 / 255, green: 27 / 255, blue: 59 / 255)
    static let blue = Color(red: 114 / 255, green: 164 / 255, blue: 220 / 255)
    static let blue1 = Color(red: 5 / 255, green: 23 / 255, blue: 57 / 255)
    static let title1 = Color(red: 153 / 255, green: 156 / 255, blue: 171 / 255)
    static let blueButton = Color(red: 46 / 255, green: 108 / 255, blue: 200 / 255)
    static let blueSymbol = Color(red: 116 / 255, green: 167 / 255, blue: 220 / 255)
    
    
    // MARK :-

  
}


extension Color {
    static let primaryBackground = Color("Background")
    static let secondaryBackground = Color("BackgroundSecondary")
    static let tertiaryBackground = Color("BackgroundTertiary")
    
    enum Button {
        static let primary = Color("PrimaryButton")
        static let secondary = Color("SecondaryButton")
    }
    
    enum Text {
        static let primary = Color("TextPrimary")
        static let secondary = Color("TextSecondary")
    }
    
    enum symbolImage {
        static let primary = Color("SymbolPrimary")
        static let secondary = Color("SymbolSecondary")
    }
}
