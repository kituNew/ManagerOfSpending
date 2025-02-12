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
                VStack(spacing: 16) {
                    ForEach(getSortedTransactions()) { transaction in
                        NavigationLink {
                            TransactionDetailView()
                        } label: {
                            TransactionRow(transaction: transaction)
                        }
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                deleteTransaction(transaction)
                            } label: {
                                Label("Удалить", systemImage: "trash")
                            }
                        }
                    }
                }
            }
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
