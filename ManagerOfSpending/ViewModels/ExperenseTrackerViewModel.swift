//
//  ExperenseTrackerViewModel.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import Foundation

class ExperenseTrackerViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    @Published var catigorys: [Category] = [
        Category(name: "Еда", color: .red),
        Category(name: "Транспорт", color: .blue),
        Category(name: "Отдых", color: .yellow),
        Category(name: "Жильё", color: .cyan)]
    
    init() {
        let range = -30...0
        transactions = (0..<10).map { _ in
            let randomeDay = Calendar.current.date(byAdding: .day, value: range.randomElement() ?? 0, to: .now) ?? .now
            let randomCategory = catigorys.randomElement() ?? Category(name: "", color: .accentColor)
            let randomNotes = ["Обязательные траты", "Периодически траты", "Дополнительные траты", "Хотелки"].randomElement() ?? "Прочее"
            
            return Transaction(amount: Double.random(in: 1000...100000), category: randomCategory, date: randomeDay, notes: randomNotes)
        }
    }
    
    var mothlyExpenses: [(category: Category, total: Double)] {
        let groupedTransactions = Dictionary(grouping: transactions) { $0.category }
        
        return groupedTransactions.compactMap { groupedItem in
            let category = groupedItem.key
            let totalAmount = groupedItem.value.reduce(0) { result, transaction in
                result + transaction.amount
            }
            return (category: category, total: totalAmount)
        }.sorted() {$0.category.name > $1.category.name}
    }
}
