//
//  TransactionRow.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading) {
                Text(transaction.category.name)
                    .font(.headline)
                Text(transaction.notes)
                    .font(.subheadline)
                Text(transaction.date, style: .date)
                    .font(.caption)
            }
            
            Spacer()
            
            Text(transaction.amount.formatted(.currency(code: "RUB")))
                .fontWeight(.semibold)
        }
    }
}
