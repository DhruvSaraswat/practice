//
//  AddExpenseView.swift
//  practice
//
//  Created by Dhruv Saraswat on 15/03/24.
//

import Foundation
import UIKit

protocol AddExpenseDelegate {
    func addExpense(sender: Any, expense: Expense)
}

final class AddExpenseView: UIView {
    @IBOutlet private weak var expense: UITextField!
    @IBOutlet private weak var amount: UITextField!
    @IBOutlet private weak var paidBy: UITextField!
    @IBOutlet private weak var participants: UITextField!

    @IBAction func addExpense(_ sender: Any) {
        let expense = Expense(expenseName: expense.text ?? "",
                              total: Int(amount.text ?? "0") ?? 0,
                              paidBy: paidBy.text ?? "",
                              participantsCSV: participants.text ?? "")

        delegate?.addExpense(sender: self, expense: expense)
    }

    var delegate: AddExpenseDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
