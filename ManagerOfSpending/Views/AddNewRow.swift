//
//  AddNewRow.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 19.02.2025.
//

import SwiftUI

struct AddNewRow: View {
    @StateObject var viewModel: ExperenseTrackerViewModel
    @Binding var isShowingSheet: Bool
    
    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var note: String = ""
    
    @State private var categoriesString: [String] = []
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Сумма", text: $amount)
                    .font(.system(size: 16, weight: .medium))
                    .textFieldStyle(.plain)
                
                Picker("Категория", selection: $category) {
                    ForEach(categoriesString, id: \.self) {
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
        .onAppear {
            categoriesString = viewModel.catigorys.map {$0.name}
            category = categoriesString.first ?? ""
        }
    }
    
    private func addNewTransaction() {
        let myCategory = viewModel.catigorys.first(where: {$0.name == category}) ?? Category(name: category, color: "gray")
        viewModel.transactions.append(Transaction(amount: Double(amount) ?? 0, category: myCategory, date: Date(), notes: note))
    }
}
