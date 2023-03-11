//
//  ResultViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit

enum Result {
    case win
    case lose
}


protocol ResultViewControllerDelegate: AnyObject {
    func didTapRestart()
}

class ResultViewController: UIViewController {

    var result: Result?

    @IBOutlet
    private var resultLabel: UILabel!
    weak var delegate: ResultViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        switch result {
            case .win:
                resultLabel.text = "You win!"
            case .lose:
                resultLabel.text = "You lose!"
        case .none:
            resultLabel.text = "error"
        }
    }

    @IBAction
    private func restartTap() {
        delegate?.didTapRestart()
    }
}


