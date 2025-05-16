//
//  OffersCategoryItem.swift
//  AmexClone
//
//  Created by Jonathan Mora on 12/04/25.
//

import SwiftUI

struct OffersCategoryItem: View {
    
    let category: PromotionCategory
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image(systemName: category.iconCategory)
                .resizableSymbolImage(size: .medium)
                .foregroundStyle(isSelected ? .white : Colors.blueSymbol)
            Text(category.nameCategory)
                .foregroundStyle(isSelected ? .white : Colors.blueSymbol)
            
        }
        .padding()
        .background {
            if isSelected {
                Colors.blueButton
            }
        }
        .sectionBoxBackground()
        .cornerRadius(56)
        
    }
}

struct PromotionItem: View {
    
    var promotions: Promotion
    
    
    var body: some View {
        VStack {
            HStack(spacing: 18) {
                Image(promotions.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(4)
                VStack(alignment: .leading, spacing: 6) {
                    Text(promotions.title)
                        .font(.body)
                    Text(promotions.description)
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    Text(promotions.availableIn)
                    Text(promotions.expirationDate)
                    
                }
                .font(.caption)
                .foregroundStyle(Colors.title1)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizableSymbolImage(size: .large)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PromotionItem(promotions: Promotion(
        title: "Hertz",
        description: "$1,000 M.N de bonificación",
        availableIn: "Disponible solo en linea",
        expirationDate: "25/07/15",
        imageName: "hertz",
        category: .travel
    ))
}

