//
//  BalanceCalculation.swift
//  practice
//
//  Created by Dhruv Saraswat on 15/03/24.
//

import Foundation

struct BalanceCalculation {
    func calculateBalanceForAllParticipants(payer: Participant, participants: Set<Participant>, amount: Int) -> [Participant] {
        guard amount > 0 else { return [] }

        var numberOfParticipantsInExpense = participants.count
        if !participants.contains(payer) {
            numberOfParticipantsInExpense += 1
        }

        var mutableParticipants: [Participant] = []

        for participant in participants {
            var mutableParticipant = participant
            if participant == payer {
                mutableParticipant.balance = Double(Double(amount) / Double(numberOfParticipantsInExpense))
            } else {
                mutableParticipant.balance = (-1) * Double(Double(amount) / Double(numberOfParticipantsInExpense))
            }
            mutableParticipants.append(mutableParticipant)
        }

        if !participants.contains(payer) {
            mutableParticipants.append(Participant(name: payer.name, balance: Double(Double(participants.count) * Double(amount / numberOfParticipantsInExpense))))
        }

        return mutableParticipants
    }
}
