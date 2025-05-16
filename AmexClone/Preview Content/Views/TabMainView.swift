//
//  TabMainView.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI

enum TabIdentifier: Hashable {
    case home
    case membership
    case offers
    case account
}


struct TabMainView: View {
    
    @State private var selectedItemTab: TabIdentifier = .home
    var body: some View {
        
        TabView(selection: $selectedItemTab) {
            Tab("Home", systemImage: "house", value: TabIdentifier.home) {
                 HomeView() 
                
            }
            Tab("Membership", systemImage: "staroflife.shield", value: TabIdentifier.home) {
                MembershipView()
            }
            Tab("Offers", systemImage: "location.app.fill", value: TabIdentifier.home) {
                OffersView(isHiddenSubtitle: true)
            }
            Tab("Account", systemImage: "person", value: TabIdentifier.home) {
                AccountView()
            }
        }
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TabMainView()
}
