//
//  Coordinator.swift
//  AmexClone
//
//  Created by Jonathan Mora on 17/04/25.
//

import SwiftUI

enum AppPages: String, Identifiable {
    var id: String { self.rawValue }
    
    case showTransactionDetails
}

enum Sheet: String, Identifiable {
    var id: String { self.rawValue }
    
    case moreOptions
}
enum FullScreenCover: String, Identifiable {
    var id: String { self.rawValue }
    
    case showCardDetails
    
}

class Coordinator: ObservableObject {
    
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    
    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func presentFullScreenCover(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    
    @ViewBuilder
    func buid(page: AppPages) -> some View {
        switch page {
        case .showTransactionDetails: ShowtransactionDetailsView()
        }
    }
    
    @ViewBuilder
    func buildSheet(_ sheet: Sheet) -> some View {
        switch sheet {
        case .moreOptions: MoreOptionsView()
        }
    }
    
    @ViewBuilder
    func buildCover(_ fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .showCardDetails: ShowCardDetailsView()
        }
    }
    
}


struct ShowtransactionDetailsView: View {
    var body: some View {
        Text("ShowtransactionDetailsView")
    }
}

struct MoreOptionsView: View {
    var body: some View {
        Text("MoreOptionsView")
    }
}

struct ShowCardDetailsView: View {
    var body: some View {
        Text("ShowCardDetailsView")
    }
}


struct CoordinatorView<Content: View>: View {
    @StateObject private var coordinator = Coordinator()
    var content: () -> Content

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            content()
                .navigationDestination(for: AppPages.self) { page in
                    coordinator.buid(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.buildSheet(sheet)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { screenCover in
                    coordinator.buildCover(screenCover)
                }
        }
        .environmentObject(coordinator)
    }
}

