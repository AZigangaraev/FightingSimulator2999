//
//  ResultCoordinator.swift
//  FightingSimulator2999
//
//  Created by Alsu Faizova on 11.03.2023.
//

import UIKit
import Combine

class AppCoordinator {
    weak var window: UIWindow?
    static let shared: AppCoordinator = .init()
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    private weak var navigationController: UINavigationController?
    var fightService: FightService = RestFightService()
    
    func start() -> UIViewController {
        let controller: FightViewController = storyboard.instantiateViewController(identifier: "FightViewController")
        let presenter = FightPresenter(
            fightService: fightService,
            view: controller
        )
        controller.presenter = presenter
        let navigationController = UINavigationController(rootViewController: controller)
        self.navigationController = navigationController
        return navigationController
    }
    
    func showResult() {
        let controller: ResultViewController = storyboard.instantiateViewController(identifier: "ResultViewController")
        let fightService: FightService = RestFightService()
        controller.fightService = fightService
        navigationController?.pushViewController(controller, animated: true)
    }
}
