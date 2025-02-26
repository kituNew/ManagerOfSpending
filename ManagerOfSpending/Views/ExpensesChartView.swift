//
//  ExpensesChartView.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import SwiftUI
import Charts

struct ExpensesChartView: View {
    let mothlyExpenses: [(category: Category, total: Double)]
    let categorys: [Category]
    
    var body: some View {
        VStack {
            Chart {
                ForEach(mothlyExpenses, id: \.category.id) { item in
                    SectorMark(angle: .value("Сумма", item.total),
                               innerRadius: .ratio(0.6),
                               angularInset: 2)
                    .foregroundStyle(item.category.color)
                    .cornerRadius(16)
                }
            }
            .padding(5)
            
            HStack {
                ForEach(categorys) { category in
                    HStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(category.color) // Цвет категории
                            .frame(width: 15, height: 15)
                        
                        Text(category.name) // Название категории
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}
