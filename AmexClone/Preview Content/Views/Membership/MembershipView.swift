//
//  MembershipView.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI



struct MembershipView: View {
    @State private var showTitle = false
    @State private var isHiddenLogoMemberships: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackground
                    .ignoresSafeArea()
                ScrollView {
                    SectionHeader(isHidden: $isHiddenLogoMemberships)
                        .padding()
                    VStack {
                        
                        sectionMembershipsRewards
                            .padding(.top, 8)
                        
                        sectionReferFriends
                            .padding(.top, 8)
                        
                        sectionBenefitsTravel
                    }
                    .padding()
                }
            }
            /* .toolbar {
             ToolbarItem(placement: .principal) {
             Text("Membresía")
             .font(.headline)
             .foregroundStyle(.white)
             
             }
             }*/
        }
    }
    
    var sectionMembershipsRewards: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Membership Rewards")
                .font(.body)
                .foregroundStyle(Color.Text.secondary)
            
            Text("1,087")
                .font(.largeTitle)
                .foregroundStyle(Color.Text.primary)
                .bold()
            
            Button {
                //
            } label: {
                Text("Ver tu actividad")
            }
            .pramryButtonBlue()
            
            Divider()
                .customDivider()
            
            SectionRowView(iconName: "staroflife.shield", title: "Utiliza tus puntos", subtitle: "", isHiddenSubtitle: true)
            
            .padding(.top, 8)
            
        }
        .padding()
        .sectionBoxBackground()
        
    }
    
    
    var sectionReferFriends: some View {
        VStack {
            
            SectionRowView(iconName: "person.badge.plus", title: "Refiere a tus amigos", subtitle: "", isHiddenSubtitle: true)

        }
        .padding()
        .sectionBoxBackground()
        
    }
    
    var sectionBenefitsTravel: some View {
        VStack {
            ForEach(memberships) { group in
                VStack(alignment: .leading, spacing: 12) {
                    Text(group.title)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.vertical, 18)
                    
                    VStack(spacing: 12) {
                        ForEach(group.items) { membership in
                            BenefitsTravelRow(memberships: membership)
                        }
                    }
                    .padding()
                    .sectionBoxBackground()
                }
            
            }
        }
    }
}


struct BenefitsTravelRow: View {
    
    let memberships: Memberships
    
    var body: some View {
        VStack{
            HStack(spacing: 14) {
                Image(memberships.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(memberships.title)
                        .font(.title3)
                        .foregroundStyle(.white)
                    Text(memberships.subtitle ?? "")
                        .font(.footnote)
                        .foregroundStyle(Colors.title1)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .resizableSymbolImage(size: .medium, color: .gray)
                
            }
            .frame(maxWidth: .infinity)
        }
    }
    
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview {
    MembershipView()
}
