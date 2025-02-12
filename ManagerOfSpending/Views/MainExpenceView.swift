//
//  MainExpenceView.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import SwiftUI

struct MainExpenceView: View {
    @StateObject var viewModel = ExperenseTrackerViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8) {
                    ExpensesChartView(mothlyExpenses: viewModel.mothlyExpenses)
                        .frame(height: 250)
                        .padding()
                        .background(.background)
                        .cornerRadius(16)
                        .shadow(radius: 8)
                    
                    VStack(spacing: 16) {
                        ForEach(getSortedTransactions()) { transaction in
                            NavigationLink {
                                TransactionDetailView(transaction: transaction)
                            } label: {
                                TransactionRow(transaction: transaction)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Мои расходы")
        }
    }
    
    private func getSortedTransactions() -> [Transaction] {
        return viewModel.transactions.sorted { $0.date > $1.date }
    }
    
    private func deleteTransaction(_ transaction: Transaction) {
        withAnimation {
            viewModel.transactions.removeAll { $0.id == transaction.id }
        }
    }
}
