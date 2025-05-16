//
//  TransactionsRow.swift
//  AmexClone
//
//  Created by Jonathan Mora on 11/04/25.
//

import SwiftUI

struct TransactionsRow: View {
    
    let transaction: Transactions
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text(transaction.nameService)
                        .font(.headline)
                        .foregroundStyle(Colors.title1)
                    Text(transaction.name)
                        .foregroundStyle(Colors.blue)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(transaction.amount)
                    Text(transaction.status ?? "")
                }
                .font(.headline)
                .foregroundStyle(Colors.title1)
           
            }
        }
      
    }

}

