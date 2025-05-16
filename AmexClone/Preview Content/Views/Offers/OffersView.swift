//
//  OffersView.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI


struct CreditCardImageIcon:  View {
    var body: some View {
        VStack {
            Image(systemName: "info.circle")
                .resizableSymbolImage(size: .medium)
                .foregroundStyle(.gray)
        }
    }
}


struct OffersView: View {
    
    @State private var isHiddenLogoMemberships: Bool = true
    @State var isHiddenSubtitle: Bool
    @State private var selectedCategory: PromotionCategory = .all
    
    var body: some View {
        ZStack {
            Colors.background
                .ignoresSafeArea()
            ScrollView {
                    
                    VStack {
                        
                        SectionHeader(isHidden: $isHiddenLogoMemberships)

                        
                        sectionBonusPromotions
                            .padding(.vertical, 8)
                        
                        sectionExploreNewPromotions
                            .padding(.vertical, 8)
                        
                        sectionOffersCategory
                            .padding(.vertical, 12)
                        
                        sectionPromotion
                            .padding(.vertical, 12)
                    }
                    .padding()
                    
                    
            }
            
        }
    }
    
    
    
    @ViewBuilder
    var sectionBonusPromotions: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Total bonificado a la fecha")
                .font(.body)
                .foregroundStyle(Colors.title1)
            
            Text("$400.00")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .bold()
            
            HStack(alignment: .center) {
                CreditCardImageIcon()
                
                Spacer().frame(width: 20)
                Text("Por favor consulta los Términos y Condiciones de cada promoción")
                    .font(.caption)
                    .foregroundStyle(Colors.title1)
                    .multilineTextAlignment(.center)
            }
            .padding(.top, 8)
            
            Divider()
                .customDivider()
            
            
            VStack(alignment: .leading) {
                
                SectionRowView(iconName: "creditcard.circle", title: "Promociones", subtitle: "0 Cambios guardados", isHiddenSubtitle: false)
                
            }
            
        }
        
        .padding()
        .sectionBoxBackground()
        
    }
    
    var sectionExploreNewPromotions: some View {
        VStack {
            
            SectionRowView(iconName: "location.app.fill", title: "Explorar nuevas promociones", subtitle: "", isHiddenSubtitle: true)
        
        }
        .padding()
        .sectionBoxBackground()
    }
    
    var sectionOffersCategory: some View {
        VStack(alignment: .leading) {
            Text("Promociones Disponibles")
                .font(.title3)
                .bold()
                .foregroundStyle(.white)
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(PromotionCategory.allCases) { category in
                        OffersCategoryItem(category: category, isSelected: category == selectedCategory)
                            .onTapGesture {
                                selectedCategory = category
                                
                            }
                        
                    }
                }
            }
        }
    }
    
    var sectionPromotion: some View {
        VStack {
            VStack(spacing: 12) {
                let filteredPromotions = selectedCategory == .all
                ? MockData.promotions
                : MockData.promotions.filter { $0.category == selectedCategory }
                
                ForEach(filteredPromotions.indices, id: \.self) { index in
                    let promotion = filteredPromotions[index]
                    PromotionItem(promotions: promotion)
                    
                    if index != filteredPromotions.count - 1 {
                        Divider()
                            .customDivider()
                    }
                }

            }
            .padding()
        }
        .sectionBoxBackground()
    }
    
}

#Preview {
   OffersView(isHiddenSubtitle: true)
}
