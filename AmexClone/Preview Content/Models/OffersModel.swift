//
//  OffersModel.swift
//  AmexClone
//
//  Created by Jonathan Mora on 12/04/25.
//

import Foundation

enum PromotionCategory: String, CaseIterable, Identifiable {
    case all = "Todo"
    case restaurants = "Restaurantes"
    case service = "Servicios"
    case shopping = "Compras"
    case travel = "Viajes"

    var id: String { self.rawValue }
    
    var nameCategory: String {
        switch self {
        case .all: return "Todo"
        case .restaurants: return "Restaurantes"
        case .service: return "Servicios"
        case .shopping: return "Compras"
        case .travel: return "Viajes"
        }
    }

    var iconCategory: String {
        switch self {
        case .all: return "location"
        case .restaurants: return "fork"
        case .service: return "bell"
        case .shopping: return "cart"
        case .travel: return "airplane"
        }
    }
}


struct Promotion: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let availableIn: String
    let expirationDate: String
    let imageName: String
    let category: PromotionCategory
}


struct MockData {
    static let promotions: [Promotion] = [
        Promotion(
            title: "Sonora Grill Group",
            description: "Hasta $1,500 M.N. de bonificación.",
            availableIn: "Disponible en Establecimiento y en línea",
            expirationDate: "25/06/25",
            imageName: "sonora",
            category: .restaurants
        ),
        Promotion(
            title: "Starbucks",
            description: "2x1 en bebidas seleccionadas.",
            availableIn: "Solo en establecimiento",
            expirationDate: "25/07/10",
            imageName: "starbucks",
            category: .restaurants
        ),
        Promotion(
            title: "Amazon México",
            description: "$300 M.N. de bonificación por compras mayores a $2,000.",
            availableIn: "Disponible solo en línea",
            expirationDate: "25/06/30",
            imageName: "amazon",
            category: .shopping
        ),
        Promotion(
            title: "Liverpool",
            description: "10% de bonificación en compras con tarjeta digital.",
            availableIn: "Disponible en línea y en tienda física",
            expirationDate: "25/07/15",
            imageName: "liverpool",
            category: .shopping
        ),
        Promotion(
            title: "DHL",
            description: "$500 M.N. de bonificación por compras mayores a $2,000.",
            availableIn: "Disponible solo en línea",
            expirationDate: "25/06/30",
            imageName: "dhl",
            category: .service
        ),
        Promotion(
            title: "Bupa Seguros Gastos Médicos Mayores",
            description: "10% de bonificación en compras con tarjeta digital.",
            availableIn: "Disponible en línea",
            expirationDate: "25/07/15",
            imageName: "bupa",
            category: .service
        ),
        Promotion(
            title: "Zurich Auto y Hogar",
            description: "10% de bonificación en compras con tarjeta digital.",
            availableIn: "Disponible en línea",
            expirationDate: "25/07/15",
            imageName: "zurich",
            category: .service
        ),
        Promotion(
            title: "Beneficio Walmart Gold Elite",
            description: "Gasta $1,500 M.N. acumulados al mes.",
            availableIn: "Disponible en Establecimiento y en línea",
            expirationDate: "25/06/30",
            imageName: "walmart",
            category: .shopping
        ),
        Promotion(
            title: "Technogym",
            description: "$8,000 M.N de bonificación.",
            availableIn: "Disponible solo en Establecimiento.",
            expirationDate: "25/07/15",
            imageName: "technogym",
            category: .shopping
        ),
        Promotion(
            title: "Tempur",
            description: "$4.0000 M.N de bonificación.",
            availableIn: "Disponible en Establecimiento y en linea",
            expirationDate: "25/07/15",
            imageName: "tempur",
            category: .shopping
        )
        ,
        Promotion(
            title: "Hertz",
            description: "$1,000 M.N de bonificación",
            availableIn: "Disponible solo en linea",
            expirationDate: "25/07/15",
            imageName: "hertz",
            category: .travel
        )
    ]
}
