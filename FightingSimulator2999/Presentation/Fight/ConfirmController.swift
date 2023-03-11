//
//  ConfirmController.swift
//  FightingSimulator2999
//
//  Created by Лада on 11.03.2023.
//

import UIKit

class ConfirmController: UIViewController {
    var presenter: ConfirmationPresenter!

    @IBAction private func confirm() {
        presenter.confirm()
    }
}
