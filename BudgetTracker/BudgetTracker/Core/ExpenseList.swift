//
//  ExpenseList.swift
//  BudgetTracker
//
//  Created by Ricky Truckner on 12/9/23.
//

import Foundation
class ExpenseList: ObservableObject {
    @Published var expenses: [Expense] = []
    @Published var showAddExpense: Bool = false
}
