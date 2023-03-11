//
//  AppCoordinator.swift
//  FightingSimulator2999
//
//  Created by Лада on 11.03.2023.
//

import UIKit
import Combine


@MainActor
class AppCoordinator {
    weak var window: UIWindow?
    static let shared: AppCoordinator = .init()

    var mainService: FightService

    var cancellables: Set<AnyCancellable> = []

    func start() {
        mainService.myHealth
            .receive(on: DispatchQueue.main)
            .sink { [weak self] health in
                guard let self else { return }
            }
            .store(in: &cancellables)
        
        mainService.enemyHealth
            .receive(on: DispatchQueue.main)
            .sink { [weak self] health in
                guard let self else { return }
            }
            .store(in: &cancellables)
    }
}
