//
//  ResultViewController.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit
import Combine

class ResultViewController: UIViewController {
    enum Result {
        case win
        case lose
    }
    
    private var _isAuthorized: CurrentValueSubject<Bool, Never> = .init(false)
    
    var isAuthorized: AnyPublisher<Bool, Never> {
        _isAuthorized
            .removeDuplicates()
            .eraseToAnyPublisher()
    }

    var result: Result = .lose

    @IBOutlet private var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        _isAuthorized.value = true

        switch result {
            case .win:
                resultLabel.text = "You win!"
            case .lose:
                resultLabel.text = "You lose!"
        }
    }

    @IBAction private func restartTap() {
        _isAuthorized.value = false
        
    }
}
