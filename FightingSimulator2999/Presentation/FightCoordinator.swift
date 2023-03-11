//
//  FightCoordinator.swift
//  FightingSimulator2999
//
//  Created by Rafael Shamsutdinov on 11.03.2023.
//

import Foundation
import UIKit

class FightCoordinator: NSObject {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let presenter = FightPresenter(fightService: FightModel())
        let viewController = FightViewController(presenter: presenter)
        presenter.delegate = self
        print(13)
        navigationController.pushViewController(viewController, animated: true)
    }
}
/// не работает я запутался в delegate'ах
extension FightCoordinator: FightPresenterDelegate {
    func playerDidLose() {
        let resultViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        resultViewController.result = .lose
        resultViewController.delegate = self
        print("123")
        self.navigationController.present(resultViewController, animated: true)
    }
    
    func enemyDidLose() {
        let resultViewController = ResultViewController()
        resultViewController.result = .win
        resultViewController.delegate = self
        print("123")
        navigationController.pushViewController(resultViewController, animated: true)
    }
}

extension FightCoordinator: ResultViewControllerDelegate {
    func didTapRestart() {
        navigationController.popToRootViewController(animated: true)
    }
}
