//
//  TransactionDetailView.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import SwiftUI

struct TransactionDetailView: View {
    let transaction: Transaction
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading) {
                Text("Сумма")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(transaction.amount.formatted(.currency(code: "RUB")))
                    .font(.system(size: 32, weight: .bold))
                    
            }
            
            Divider()
            
            DetailRow(icon: "Категория", value: transaction.category.name)
            DetailRow(icon: "Дата", value: transaction.date.formatted())
            DetailRow(icon: "Заметки", value: transaction.notes)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Детали операции")
    }
}
