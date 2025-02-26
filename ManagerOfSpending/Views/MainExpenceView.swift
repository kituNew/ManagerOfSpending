//
//  MainExpenceView.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import SwiftUI

struct MainExpenceView: View {
    @StateObject var viewModel = ExperenseTrackerViewModel()
    @State private var isShowingAddNewRow = false
    
    //@State private var isPressed = false
    //@State private var thisTransaction: Transaction?

    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ExpensesChartView(mothlyExpenses: viewModel.mothlyExpenses, categorys: viewModel.catigorys)
                        .frame(height: 250)
                        .padding()
                        .cornerRadius(16)
                        .shadow(radius: 8)
                }
                
                ForEach(getSortedTransactions()) { transaction in
                    Section {
                        NavigationLink {
                            TransactionDetailView(transaction: transaction)
                        } label: {
                            TransactionRow(transaction: transaction)
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            deleteTransaction(transaction)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
                /*
                .alert(isPresented: $isPressed) {
                     Alert(title: Text("Удалить"), message: Text("Вы действительно хотите удалить транзакцию?"), primaryButton: .destructive(Text("Да")) {
                         guard let this = self.thisTransaction else { return }
                         deleteTransaction(this)
                         thisTransaction = nil
                         isPressed = false
                     }, secondaryButton: .cancel())
                 }
                 */
            }
            .background(.white)
            .navigationTitle("Мои расходы")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowingAddNewRow.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddNewRow) {
                AddNewRow(viewModel: viewModel, isShowingSheet: $isShowingAddNewRow)
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
