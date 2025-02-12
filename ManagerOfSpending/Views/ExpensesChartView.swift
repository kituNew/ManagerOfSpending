//
//  ExpensesChartView.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import SwiftUI
import Charts

struct ExpensesChartView: View {
    let mothlyExpenses: [(category: String, total: Double)]
    
    var body: some View {
        Chart {
            ForEach(mothlyExpenses, id: \.category) { item in
                SectorMark(angle: .value("Сумма", item.total),
                           innerRadius: .ratio(0.6),
                           angularInset: 2)
                    .foregroundStyle(by: .value("Категория", item.category))
                    .cornerRadius(16)
            }
        }
    }
}
