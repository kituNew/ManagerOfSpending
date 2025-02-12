//
//  ExperenseTrackerViewModel.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import Foundation

class ExperenseTrackerViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    
    init() {
        let range = -30...0
        transactions = (0..<10).map { _ in
            let randomeDay = Calendar.current.date(byAdding: .day, value: range.randomElement() ?? 0, to: .now) ?? .now
            let randomCategory = ["Еда", "Транспорт", "Отдых", "Жильё"].randomElement() ?? "Прочее"
            let randomNotes = ["Обязательные траты", "Периодически траты", "Дополнительные траты", "Хотелки"].randomElement() ?? "Прочее"
            
            return Transaction(amount: Double.random(in: 1000...100000), category: randomCategory, date: randomeDay, notes: randomNotes)
        }
    }
}
