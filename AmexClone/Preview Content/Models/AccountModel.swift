//
//  AccountModel.swift
//  AmexClone
//
//  Created by Jonathan Mora on 14/04/25.
//

import SwiftUI

struct CardOptionCard: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let destination: Destination?
}


let mockCardOption: [CardOptionCard] = [
    CardOptionCard(iconName: "creditcard.trianglebadge.exclamationmark", title: "Activar y agregar una tarjeta", destination: .activeCard),
    CardOptionCard(iconName: "lock.fill", title: "Apagar", destination: .freezeCard),
    CardOptionCard(iconName: "creditcard.fill", title: "Reemplazar", destination: .requestCardReplacement)
]

struct AccountSectionGroup: Identifiable {
    let id = UUID()
    let title: String
    let items: [AcountSection]
}

struct AcountSection: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let subtitle: String?
    let isHiddenSubtitle: Bool
}



let accountSections: [AccountSectionGroup] = [
    AccountSectionGroup(
        title: "Herramientas de Pago",
        items: [
            AcountSection(iconName: "apple.logo", title: "Apple Pay", subtitle: nil, isHiddenSubtitle: true)
        ]
    ),
    AccountSectionGroup(
        title: "Configuración",
        items: [
            AcountSection(iconName: "face.dashed", title: "Inicio de sesión con Face ID", subtitle: nil, isHiddenSubtitle: true),
            AcountSection(iconName: "lock", title: "Autenticación en dos pasos", subtitle: nil, isHiddenSubtitle: true)
        ]
    ),
    AccountSectionGroup(
        title: "Refiere amigos",
        items: [
            AcountSection(iconName: "person", title: "Y comparte lo mejor de tu Tarjeta", subtitle: "Refiere Ahora", isHiddenSubtitle: false)
        ]
    )
]


