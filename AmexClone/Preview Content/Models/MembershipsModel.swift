//
//  MembershipsModel.swift
//  AmexClone
//
//  Created by Jonathan Mora on 12/04/25.
//

import SwiftUI

struct Membership: Identifiable {
    let id = UUID()
    let title: String
    let items: [Memberships]
}

struct Memberships: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String?
}


let memberships: [Membership] = [
    Membership(title: "Beneficios", items: [
        Memberships(imageName: "explore.benefits", title: "Explora tus beneficios", subtitle: "Conoce todo lo que puedes lograr con tu tarjeta")
    ]),
    Membership(title: "Viajes y Experiencias", items: [
        Memberships(imageName: "travel.experiences", title: "Amex y viajes", subtitle: "Reserva tu viaje con ofertas exclusivas")
    ])
]
