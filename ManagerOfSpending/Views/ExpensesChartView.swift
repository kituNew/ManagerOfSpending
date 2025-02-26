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
    let viewModel: ExperenseTrackerViewModel
    
    var body: some View {
        VStack {
            Chart {
                ForEach(mothlyExpenses, id: \.category) { item in
                    SectorMark(angle: .value("Сумма", item.total),
                               innerRadius: .ratio(0.6),
                               angularInset: 2)
                    .foregroundStyle(viewModel.colors[item.category.color] ?? .gray)
                    .cornerRadius(16)
                }
            }
            .padding(5)
            
            HStack {
                ForEach(viewModel.catigorys) { category in
                    HStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(viewModel.colors[category.color] ?? .gray)
                            .frame(width: 15, height: 15)
                        
                        Text(category.name)
                            .font(.caption)
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}
