//
//  AppCoordinator.swift
//  FightingSimulator2999
//
//  Created by Эльвира Самигуллина on 11.03.2023.
//

import UIKit
import Combine

class AppCoordinator {
    weak var window: UIWindow?
    static let shared: AppCoordinator = .init()
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)

    func showFight() {
        let controller: FightViewController = storyboard.instantiateViewController(identifier: "FightViewController")
        let presenter = FightPresenter()
        controller.presenter = presenter
        presenter.view = controller
        window?.rootViewController = controller
    }
    
    func showResult() {
        let controller: ResultViewController = storyboard.instantiateViewController(identifier: "ResultViewController")
        window?.rootViewController = controller
    }
}
