//
//  BudgetTrackerApp.swift
//  BudgetTracker
//
//  Created by Ricky Truckner on 12/9/23.
//

import SwiftUI

@main
struct BudgetTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
