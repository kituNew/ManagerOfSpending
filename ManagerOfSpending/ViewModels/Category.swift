//
//  Category.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 26.02.2025.
//

import SwiftUI

struct Category: Equatable, Identifiable, Hashable {
    let id = UUID()
    let name: String
    let color: Color
}
