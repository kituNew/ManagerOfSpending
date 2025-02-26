//
//  Category.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 26.02.2025.
//

import SwiftUI

struct Category: Equatable, Identifiable, Hashable, Codable {
    var id = UUID()
    let name: String
    let color: String
}
