//
//  Transaction.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import Foundation

struct Transaction: Equatable, Identifiable {
    let id = UUID()
    let amount: Double
    let category: String
    let date: Date
    let notes: String
}
