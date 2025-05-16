//
//  TransactionsModel.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI

struct TransactionGrouped: Identifiable {
    let id = UUID()
    let title: String
    let items: [Transactions]
}

struct Transactions: Identifiable {
    let id = UUID()
    let nameService: String
    let amount: String
    let status: String?
    let name: String
}

let transactionData: [TransactionGrouped] = [

    TransactionGrouped(title: "6 abr", items: [
        Transactions(nameService: "AMAZON MX MARKETPLACE*A MEXICO CITY", amount: "$219.00", status: nil, name: "SAMANTHA X MURUETA A"),
        Transactions(nameService: "RAPPI*RAPPI MEXICO MEXICO CITY", amount: "$212.35", status: nil, name: "SAMANTHA X MURUETA A")]),
    
    TransactionGrouped(title: "7 abr", items: [
        Transactions(nameService: "BAE NINOS HEROES DE CHA CD MEXICO", amount: "$52.00", status: "Completado", name: "SAMANTHA X MURUETA A")]),
    
    
    TransactionGrouped(title: "10 abr", items: [
        Transactions(nameService:"STARBUCKS OLO EC" , amount: "$50.00", status: "Pendiente", name: "SAMANTHA X MURUETA A"),
        Transactions(nameService: "METROTAPAMEX", amount: "$5.00", status: "Pendiente", name: "SAMANTHA X MURUETA A")])
]
