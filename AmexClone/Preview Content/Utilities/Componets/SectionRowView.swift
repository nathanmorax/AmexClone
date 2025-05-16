//
//  SectionRowView.swift
//  AmexClone
//
//  Created by Jonathan Mora on 14/04/25.
//

import SwiftUI

struct SectionRowView: View {
    
    let iconName: String
    let title: String
    let subtitle: String
    
    let isHiddenSubtitle: Bool
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                if iconName == "location.app.fill" {
                    Image(systemName: iconName)
                        .resizableSymbolImage(size: .medium)
                        .rotateInYOnAppear()
                        .scaledToFill()
                } else {
                    Image(systemName: iconName)
                        .resizableSymbolImage(size: .medium)
                        .scaledToFill()


                }
                
                                
                Text(title)
                    .foregroundStyle(.white)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                if !isHiddenSubtitle {
                    Text(subtitle)
                        .foregroundStyle(Color.symbolPrimary)
                        .font(.footnote)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                }
                
                
                Image(systemName: "chevron.right")
                    .resizableSymbolImage(size: .medium, color: .gray)
                
            }
            
        }
    }
}

#Preview {
    //SectionRowView()
}
