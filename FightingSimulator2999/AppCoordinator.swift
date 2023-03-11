//
//  AppCoordinator.swift
//  FightingSimulator2999
//
//  Created by Artyom Mitrofanov on 11.03.2023.
//

import UIKit
import Combine

@MainActor
class AppCoordinator {
    weak var window: UIWindow?
    static let shared: AppCoordinator = .init()
    
    var fightServise: FightService = RestFightService.shared
    
    var cancellables: Set<AnyCancellable> = []
    
    func start() {
        fightServise.enemyHealth
            .receive(on: DispatchQueue.main)
            .sink { [weak self] hp in
                guard let self else { return }
                if hp != 0 {
                    self.showFightVC()
                } else {
                    self.showResultVC()
                }
            }
            .store(in: &cancellables)
    }
    
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func showFightVC() {
        let controller: FightViewController = storyboard.instantiateViewController(identifier: "FightViewController")
        let presenter = FightPresenter()
        controller.presenter = presenter
        presenter.view = controller
        window?.rootViewController = controller
    }
    
    func showResultVC() {
        let controller: ResultViewController = storyboard.instantiateViewController(identifier: "ResultViewController")
        window?.rootViewController = controller
    }
}
