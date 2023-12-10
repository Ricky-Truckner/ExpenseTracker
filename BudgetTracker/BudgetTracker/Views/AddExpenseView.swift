//
//  AddExpenseView.swift
//  BudgetTracker
//
//  Created by Ricky Truckner on 12/9/23.
//

import SwiftUI

struct AddExpenseView: View {
    @EnvironmentObject var expenseList: ExpenseList
    @State private var name = ""
    @State private var date = Date()
    @State private var amount = 0.0

    var body: some View {
        NavigationView {
            Form {
                TextField("Expense Name", text: $name)
                DatePicker("Date", selection: $date)
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
            }
            .navigationTitle("Add Expense")
            .toolbar {
                Button("Save") {
                    expenseList.expenses.append(Expense(name: name, date: date, amount: amount))
                    expenseList.showAddExpense = false
                }
                .disabled(name.isEmpty)
            }
        }
    }
}

struct AddExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseView()
    }
}
