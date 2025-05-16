//
//  SectionHeader.swift
//  AmexClone
//
//  Created by Jonathan Mora on 12/04/25.
//

import SwiftUI

struct SectionHeader: View {
    
    //var title: String
    @Binding var isHidden: Bool
    
    var body: some View {
        VStack  {
            HStack {
                /*Text(title)
                 .font(.title)
                 .foregroundStyle(Color.Text.primary)
                 .bold()
                 .padding()
                 .frame(maxWidth: .infinity, alignment: .leading)*/
                Spacer()
                if !isHidden {
                    Spacer()
                    Image("logoMemberships")
                        .resizable()
                        .frame(width: 135, height: 55)
                        .scaledToFill()
                    
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.leading, 0)
            
            HStack {
                Image("cardGold")
                    .resizable()
                    .frame(width: 45, height: 28)
                    .scaledToFill()
                    .shadow(color: isHidden ? Color.yellow.opacity(0.6) : .clear, radius: 20, x: 0, y: 0)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("The Gold Elite Credit Card American Express")
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .fontWeight(isHidden ? .medium : .regular)
                            .foregroundStyle(isHidden ? Color.Text.primary : Color.Text.secondary)

                        Text( isHidden ? "****13009" :"(****13009)")
                            .font(.caption)
                            .foregroundStyle(isHidden ? Color.Text.primary : Color.Text.secondary)
                    }
                    
                    if isHidden {
                        Button {
                            
                        } label: {
                            Spacer()
                            Image(systemName: "chevron.right")
                                .resizableSymbolImage(size: .medium, color: Color.symbolImage.secondary)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
         
            
        }
        .frame(maxWidth: .infinity)
        
    }
}
#Preview {
    SectionHeader(isHidden: .constant(false))
}
