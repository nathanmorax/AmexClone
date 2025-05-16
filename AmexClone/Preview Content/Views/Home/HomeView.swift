//
//  HomeView.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let amount: String
    let status: String?
    let name: String
}
typealias TransactionsByDate = [String: [Transaction]]


struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackground
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        cardSection
                            .padding(.top, 10)
                        
                        currentBalanceSection
                            .padding(.top, 32)
                        
                        payCardSection
                            .padding(.top, 8)
                        
                        transactionsSection
                            .padding(.top, 32)
                    }
                    .padding()
                    
                }
            }
            .toolbar {
                toolBarItem
            }
            
        }
    }
    
    @ViewBuilder
    var toolBarItem: some View {
        VStack(spacing: 2) {
            Text("The Gold Elite Credit Card American Express")
                .font(.headline)
            Text("****13009")
                .font(.caption)
        }
        .foregroundColor(.white)
    }
    
    var cardSection: some View {
        VStack {
            Image("cardGold")
                .resizable()
                .aspectRatio(1.586, contentMode: .fit)
                .cornerRadius(12)
                .shadow(color: Color.yellow.opacity(0.6), radius: 20, x: 0, y: 0)
            
        }
        .padding(.horizontal, 62)
    }
    
    var currentBalanceSection: some View {
        
        
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Saldo a la fecha")
                                .font(.body)
                            Text("$15,456.47")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .bold()
                        }
                        Spacer()
                        
                        Button {
                            coordinator.presentSheet(.moreOptions)
                            
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .resizable()
                                .frame(width: 22, height: 22)
                                .foregroundStyle(Colors.blue)
                        }
                    }
                    
                    HStack {
                        Text("Saldo a pagar")
                        Spacer()
                        Text("$9,651.21")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                    }
                    
                    HStack {
                        Text("Credito disponible")
                        Spacer()
                        Text("$1,568.00")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                        
                    }
                    
                    HStack {
                        Text("Membership Rewards")
                        Spacer()
                        Text("1,085")
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    
                    Text("$722.09 Monto minimo a pagar al 23 abr")
                    Text("Ultima sesion: 11 abr 2025, 18:17 CST")
                    
                }
            }
            
            Divider()
                .customDivider()
            
            Button {
                coordinator.push(page: .showTransactionDetails)
                print("Presentar Sheet de mas opciones")
            } label: {
                Text("Saldo y estados de cuenta")
                    .font(.footnote)
                    .foregroundStyle(Colors.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 8)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .sectionBoxBackground()
        .foregroundStyle(Colors.title1)
        .font(.caption)
        
    }
    
    
    var payCardSection: some View {
        VStack {
            Button {
                // Pay card
            } label: {
                Image(systemName: "dollarsign.circle")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundStyle(Colors.blue)
                Text("Pagar la tarjeta")
                    .foregroundStyle(Colors.blue)
                    .bold()
                
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.vertical, 16)
        .secondaryBoxBackground()
    }
    
    
    var transactionsSection: some View {
        VStack {
            ForEach(transactionData) { group in
                VStack(alignment: .leading, spacing: 12) {
                    Text(group.title)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding(.vertical, 18)
                    
                    VStack(spacing: 12) {
                        ForEach(group.items) { item in
                            TransactionsRow(
                                transaction: item
                            )
                            if item.id != group.items.last?.id {
                                Divider().customDivider()
                            }
                        }
                    }
                    .padding()
                    .secondaryBoxBackground()
                }
            }
        }
    }
}

