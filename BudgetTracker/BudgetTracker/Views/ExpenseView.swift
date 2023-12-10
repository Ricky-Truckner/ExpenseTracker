// ExpenseView.swift
// BudgetTracker
//
// Created by Ricky Truckner on 12/9/23.
//

import SwiftUI
import CoreData

struct Expense: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
    let amount: Double
}

// Move all code from ContentView.swift to ExpenseView.swift

struct ExpenseView: View {
    @StateObject private var expenseList = ExpenseList()
    @State private var name = ""
    @State private var date = Date()
    @State private var amount = 0.0

    private var totalSpent: Double {
        expenseList.expenses.reduce(0) { $0 + $1.amount }
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expenseList.expenses) { expense in
                        HStack {
                            Text(expense.name)
                            Spacer()
                            Text(expense.date, formatter: itemFormatter)
                            Spacer()
                            Text(String(format: "$%.2f", expense.amount))
                        }
                    }
                    .onDelete(perform: deleteExpenses)
                }
                HStack {
                    Text("Total Spent: ")
                    Text(String(format: "$%.2f", totalSpent))
                        .bold()
                }
                .padding(.horizontal)
                Button("Add Expense") {
                    expenseList.showAddExpense = true
                }
            }
            .navigationTitle("Expense Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
        .environmentObject(expenseList)
        .sheet(isPresented: $expenseList.showAddExpense) {
            AddExpenseView()
        }
    }

    private func deleteExpenses(offsets: IndexSet) {
        expenseList.expenses.remove(atOffsets: offsets)
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    return formatter
}()

struct Previews_ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView()
    }
}
