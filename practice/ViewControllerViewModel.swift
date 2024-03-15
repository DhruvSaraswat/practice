//
//  ViewControllerViewModel.swift
//  practice
//
//  Created by Dhruv Saraswat on 15/03/24.
//

import Foundation

struct ViewControllerViewModel {
    func isValidExpense(_ expense: Expense) -> Bool {
        guard !expense.expenseName.isEmpty,
              !expense.paidBy.isEmpty,
              !expense.participantsCSV.isEmpty,
              expense.total > 0,
              !expense.participantsCSV.lowercased().elementsEqual(expense.paidBy) else {
            return false
        }

        return true
    }
}
