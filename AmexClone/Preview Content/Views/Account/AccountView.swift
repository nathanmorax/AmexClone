//
//  AccountView.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI


struct AccountView: View {
    
    @State var router: Router = .init()
    @State private var isHiddenLogoMemberships: Bool = false
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            
            ZStack{
                Colors.background
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        SectionMyAccount
                        
                        CardSetupOptionsView
                            .padding(.top, 12)
                        
                        manageCardView
                        
                            .padding(.top, 12)
                        
                        
                        requestAadditionalCard
                        
                            .padding(.top, 12)
                        
                        sectionAccount
                            .padding(.top, 12)
                        
                        
                    }
                    .padding()
                }
            }
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .activeCard:
                    Activar()
                case .freezeCard:
                    Apagar()
                case .requestCardReplacement:
                    Remplazar()
                }
            }
            
            .sheet(item: router.sheetItems) { destination in
                if let destination = destination.destination as? SheetDestination {
                    
                    switch destination {
                    case .manageCard: Administrar()
                    case .addCard: Administrar()
                        
                    }
                }
            }
        }
        .environment(router)
    }
    
    
    @ViewBuilder
    var SectionMyAccount: some View {
        ZStack(alignment: .leading) {
            Image("logoMemberships")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .foregroundColor(Colors.blue)
                .frame(width: 180)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            Spacer()
            VStack(alignment: .leading) {
                Text("Jonathan Jesus")
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()
                
                Text("Miembro desde el '23")
                    .foregroundStyle(.white)
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity)
        .boxBackground(color: Color.secondaryBackground)
    }
    
    var CardSetupOptionsView: some View {
        VStack {
            HStack(spacing: 12) {
                ForEach(mockCardOption) { option in
                    CardSetupOptionItemView(optionsCard: option)
                }
            }
        }
    }
    
    var manageCardView: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Administrar tu tarjeta")
                        .font(.title)
                        .foregroundStyle(Color.Text.primary)
                    Text("Establecer preferencias, apagar Tarjeta, administrar Tarjetas y más")
                        .font(.caption)
                        .foregroundStyle(Color.Text.secondary)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image("manageCard")
                    .resizable()
                    .frame(width: 80, height: 80)
                
            }
            Divider().customDivider()
            
            SectionHeader(isHidden: .constant(true))
            
        }
        .onTapGesture {
            router.presentSheet(SheetDestination.manageCard)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .boxBackground(color: Color.backgroundSecondary)
        
    }
    
    var requestAadditionalCard: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Solicita una tarjeta adicional")
                        .font(.title3)
                        .foregroundStyle(Color.Text.primary)
                    
                    Text("Y comparte los benficios de tu tarjeta")
                        .font(.callout)
                        .foregroundStyle(Color.Text.primary)
                    
                    
                }
                Spacer()
                Image(systemName: "person.badge.plus")
                    .resizableSymbolImage(size: .large)
                
            }
            Button {
                router.presentSheet(SheetDestination.manageCard)
                
            } label: {
                Text("Agregar Adicional")
                    .foregroundStyle(Color.symbolPrimary)
                    .fontWeight(.semibold)
            }
            
            .padding()
            .cornerRadius(14)
            .background(Color.Button.secondary)
            .cornerRadius(14)
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .boxBackground(color: Color.tertiaryBackground)
    }
    
    var sectionAccount: some View {
        VStack {
            ForEach(accountSections) { group in
                VStack(alignment: .leading, spacing: 12) {
                    Text(group.title)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.vertical, 4)
                    
                    VStack(spacing: 20) {
                        ForEach(group.items) { item in
                            SectionRowView(
                                iconName: item.iconName,
                                title: item.title,
                                subtitle: item.subtitle ?? "",
                                isHiddenSubtitle: item.isHiddenSubtitle
                            )
                            
                            if item.id != group.items.last?.id {
                                Divider().customDivider()
                            }
                        }
                    }
                    .padding()
                    .sectionBoxBackground()
                }
            }
        }
    }
    
}

struct CardSetupOptionItemView: View {
    
    @Environment(Router.self) private var router
    let optionsCard: CardOptionCard
    
    var body: some View {
        
        Button(action: {
            
            
            if let destination = optionsCard.destination {
                self.router.push(destination)
                
            }
        }) {
            VStack {
                Image(systemName: optionsCard.iconName)
                    .resizableSymbolImage(size: .medium, color: .symbolPrimary)
                
                Text(optionsCard.title)
                    .font(.footnote)
                    .foregroundStyle(.symbolPrimary)
                    .multilineTextAlignment(.center)
            }
        }
        
        
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: 69)
        .padding(.vertical)
        .boxBackground(color: Color.secondaryBackground)
    }
}


#Preview {
    AccountView()
}


struct Activar: View {
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
        }
    }
}

struct Apagar: View {
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
        }
    }
}

struct Remplazar: View {
    var body: some View {
        ZStack {
            Color.yellow
                .ignoresSafeArea()
            
        }
    }
}

struct Administrar: View {
    var body: some View {
        ZStack {
            Color.gray
                .ignoresSafeArea()
            
        }
    }
}
