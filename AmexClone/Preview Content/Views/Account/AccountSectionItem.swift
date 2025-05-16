//
//  AccountSectionItem.swift
//  AmexClone
//
//  Created by Jonathan Mora on 14/04/25.
//

import SwiftUI

struct AccountSectionItem: View {
    
    let accountSection: AcountSection
    
    var body: some View {
        VStack {
            HStack(spacing: 18) {
                Image(accountSection.iconName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(4)
                VStack(alignment: .leading, spacing: 6) {
                    Text(accountSection.title)
                        .font(.body)
                    Text(accountSection.subtitle ?? "")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                    
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


#Preview {
    AccountSectionItem(accountSection: AcountSection(iconName: "apple.logo", title: "Planifica tu viaje", subtitle: "Descubre beneficios exclusivos", isHiddenSubtitle: true))
}
