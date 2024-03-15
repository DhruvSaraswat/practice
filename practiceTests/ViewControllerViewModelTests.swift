//
//  ViewControllerViewModelTests.swift
//  practiceTests
//
//  Created by Dhruv Saraswat on 15/03/24.
//

import XCTest
@testable import practice

final class ViewControllerViewModelTests: XCTestCase {

    var sut: ViewControllerViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ViewControllerViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func test_isValidExpense_expenseNameIsEmpty() {
        let randomTotal = Int.random(in: 1..<10)
        let expense = Expense(expenseName: "", total: randomTotal, paidBy: "sdfsdf", participantsCSV: "adfde,fghi")
        XCTAssertFalse(sut.isValidExpense(expense))
    }

    func test_isValidExpense_TotalIs0() {
        let expense = Expense(expenseName: "dfada", total: 0, paidBy: "sdfsdf", participantsCSV: "adfde,fghi")
        XCTAssertFalse(sut.isValidExpense(expense))
    }

    func test_isValidExpense_TotalIsLessThan0() {
        let randomNegativeInteger = Int.random(in: -100..<0)
        let expense = Expense(expenseName: "dfada", total: randomNegativeInteger, paidBy: "sdfsdf", participantsCSV: "adfde,fghi")
        XCTAssertFalse(sut.isValidExpense(expense))
    }

    func test_isValidExpense_EmptyPaidBy() {
        let randomTotal = Int.random(in: 1..<10)
        let expense = Expense(expenseName: "dfada", total: randomTotal, paidBy: "", participantsCSV: "adfde,fghi")
        XCTAssertFalse(sut.isValidExpense(expense))
    }

    func test_isValidExpense_EmptyParticipantsCSV() {
        let randomTotal = Int.random(in: 1..<10)
        let expense = Expense(expenseName: "dfada", total: randomTotal, paidBy: "asdad", participantsCSV: "")
        XCTAssertFalse(sut.isValidExpense(expense))
    }

    func test_isValidExpense_ParticipantContainsOnlyPayer() {
        let randomTotal = Int.random(in: 1..<10)
        let commonName = "dfada"
        let expense = Expense(expenseName: "adada", total: randomTotal, paidBy: commonName, participantsCSV: commonName)
        XCTAssertFalse(sut.isValidExpense(expense))
    }

    func test_isValidExpense_AllConditionsAreSatisfied() {
        let randomTotal = Int.random(in: 1..<10)
        let expense = Expense(expenseName: "dfada", total: randomTotal, paidBy: "asdad", participantsCSV: "sdfsdf")
        XCTAssertTrue(sut.isValidExpense(expense))
    }

}
