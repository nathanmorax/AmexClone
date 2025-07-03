//
//  TabMainView.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI

enum TabNavigationOptions: String, Identifiable, CaseIterable {
    case home
    case membership
    case offers
    case account
    
    static let mainPages: [TabNavigationOptions] = [.home, .membership, .offers, .account]
    
    var id: String { rawValue }

    
    var name: String {
        switch self {
        case .home:
            return "Home"
        case .membership:
            return "Membership"
        case .offers:
            return "Offers"
        case .account:
            return "Account"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .home:
            return "house"
        case .membership:
            return "staroflife.shield"
        case .offers:
            return "location.app.fill"
        case .account:
            return "person"
        }
    }
    
    @ViewBuilder
    func viewForPage() -> some View {
        switch self {
        case .home:
            HomeView()
        case .membership:
            MembershipView()
        case .offers:
            OffersView(isHiddenSubtitle: true)
        case .account:
            AccountView()
        }
    }
}


struct TabMainView: View {
    @State private var selectedItemTab: TabNavigationOptions = .home

    var body: some View {
        TabView(selection: $selectedItemTab) {
            ForEach(TabNavigationOptions.mainPages) { tab in
                tab.viewForPage()
                    .tabItem {
                        Label(tab.name, systemImage: tab.systemImageName)
                    }
                    .tag(tab)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TabMainView()
}
