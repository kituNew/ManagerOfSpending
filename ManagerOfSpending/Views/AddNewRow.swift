//
//  AddNewRow.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 19.02.2025.
//

import SwiftUI

struct AddNewRow: View {
    @Binding var transactions: [Transaction]
    @Binding var isShowingSheet: Bool
    
    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var note: String = ""

    var body: some View {
        VStack {
            Text("Создать новую трату")
                .padding()
                .frame(maxWidth: .infinity, alignment: .top)
                .font(.system(size: 32, weight: .bold))
            
            TextField("Сумма", text: $amount)
                .padding()
                .font(.system(size: 25, weight: .medium))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Категория", text: $category)
                .padding()
                .font(.system(size: 25, weight: .medium))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Заметка", text: $note)
                .padding()
                .font(.system(size: 25, weight: .medium))
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Создать") {
                addNewTransaction()
                isShowingSheet.toggle()
            }
            .font(.system(size: 25, weight: .semibold))
        }
    }
    
    private func addNewTransaction() {
        transactions.append(Transaction(amount: Double(amount) ?? 0, category: category, date: Date(), notes: note))
    }
}
