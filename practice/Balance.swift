//
//  Balance.swift
//  practice
//
//  Created by Dhruv Saraswat on 15/03/24.
//

import Foundation
import UIKit

final class Balance: UIView {
    @IBOutlet private weak var name: UIButton!
    @IBOutlet private weak var balance: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
