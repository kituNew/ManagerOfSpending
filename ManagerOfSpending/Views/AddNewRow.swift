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
    @State private var category: String = "Не указано"
    @State private var note: String = ""
    
    var categories: [String] = ["Не указано", "Еда", "Транспорт", "Отдых", "Жильё", "Прочее"]

    var body: some View {
        NavigationStack {
            List {
                TextField("Сумма", text: $amount)
                    .font(.system(size: 16, weight: .medium))
                    .textFieldStyle(.plain)
                
                Picker("Категория", selection: $category) {
                    ForEach(categories, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Заметка", text: $note)
                    .font(.system(size: 16, weight: .medium))
                    .textFieldStyle(.plain)
            }
            .listStyle(.automatic)
            .navigationTitle("Новый расход")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        addNewTransaction()
                        isShowingSheet.toggle()
                    }) {
                        Text("Создать")
                    }
                }
            }
            .scrollDisabled(true)
        }
    }
    
    private func addNewTransaction() {
        transactions.append(Transaction(amount: Double(amount) ?? 0, category: category, date: Date(), notes: note))
    }
}
