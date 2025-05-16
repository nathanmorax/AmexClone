//
//  AccountCoordinator.swift
//  AmexClone
//
//  Created by Jonathan Mora on 15/05/25.
//

import SwiftUI

enum Destination: Hashable {
    case activeCard
    case freezeCard
    case requestCardReplacement
}

enum SheetDestination: Identifiable {
    var id: String {
        switch self {
        case .manageCard: "manageCard"
        case .addCard: "addCard"
        }
    }
    
    case manageCard
    case addCard
}
