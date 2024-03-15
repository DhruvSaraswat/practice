//
//  ViewController.swift
//  practice
//
//  Created by Dhruv Saraswat on 15/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var containerView: UIView!
    private let viewModel = ViewControllerViewModel()
    private let balanceCalculation = BalanceCalculation()

    private var addExpenseView: AddExpenseView?
    private var balance: Balance?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupSegmentedControl()
        setupAddExpenseView()
        setupBalance()
        switchSelectedSegment(to: 0)
    }

    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
    }

    private func setupAddExpenseView() {
        addExpenseView = UINib(nibName: "AddExpenseView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? AddExpenseView
        addExpenseView?.delegate = self
    }

    private func setupBalance() {
        balance = UINib(nibName: "Balance", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? Balance
    }

    private func switchSelectedSegment(to index: Int) {
        switch index {
        case 0:
            /// Show the `Add Expense` view
            guard let expenseView = addExpenseView else { return }
            containerView.subviews.forEach { $0.removeFromSuperview() }
            expenseView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(expenseView)
            expenseView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
            expenseView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
            expenseView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            expenseView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true

        case 1:
            /// Show the `View Balances` view
            containerView.subviews.forEach { $0.removeFromSuperview() }

        default:
            break
        }
    }

}

extension ViewController: AddExpenseDelegate {
    func addExpense(sender: Any, expense: Expense) {
        if viewModel.isValidExpense(expense) {
            var set: Set<Participant> = Set()
            let participants = expense.getParticipantsFromCSV()
            participants.forEach { participant in
                set.insert(participant)
            }
            let finalParticipantsWithBalance = balanceCalculation.calculateBalanceForAllParticipants(payer: Participant(name: expense.paidBy, balance: nil), participants: set, amount: expense.total)
            debugPrint("Participants with Balance = \(finalParticipantsWithBalance)")
            switchSelectedSegment(to: 2)
        } else {
            /// Show alert saying that the input is invalid.
        }
    }
}

