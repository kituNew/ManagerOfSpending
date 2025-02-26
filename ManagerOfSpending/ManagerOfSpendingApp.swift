//
//  ManagerOfSpendingApp.swift
//  ManagerOfSpending
//
//  Created by Zaitsev Vladislav on 12.02.2025.
//

import SwiftUI
import Combine

@main
struct ManagerOfSpendingApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var viewModel = ExperenseTrackerViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainExpenceView(viewModel: viewModel)
                .onChange(of: scenePhase) { _, phase in
                    if phase == .background {
                        UserDefaults.standard.save(value: viewModel.transactions, forKey: "transactions")
                    }
                }
        }
    }
}
