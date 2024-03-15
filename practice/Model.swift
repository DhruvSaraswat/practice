//
//  Model.swift
//  practice
//
//  Created by Dhruv Saraswat on 15/03/24.
//

import Foundation

struct Expense {
    var expenseName: String
    var total: Int
    var paidBy: String
    /// var participants: [Participant]?

    /// comma separated values of participants
    var participantsCSV: String

    func getParticipantsFromCSV() -> [Participant] {
        let valuesSplitByComma = participantsCSV.split(separator: ",")

        guard !valuesSplitByComma.isEmpty else {
            return []
        }

        var participants: [Participant] = []
        valuesSplitByComma.forEach { value in
            participants.append(Participant(name: String(value), balance: nil))
        }

        return participants
    }
}

struct Participant: Hashable {
    var name: String
    var balance: Double?

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

    static func ==(lhs: Participant, rhs: Participant) -> Bool {
        lhs.name.lowercased().elementsEqual(rhs.name.lowercased())
    }
}
