//
//  Transaction.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import Foundation

struct Transaction: Equatable, Identifiable, Codable {
    var id = UUID()
    let amount: Double
    let category: Category
    let date: Date
    let notes: String
}
