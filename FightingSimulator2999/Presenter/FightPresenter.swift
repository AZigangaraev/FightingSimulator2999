//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Карина Хайруллина on 11.03.2023.
//


import Foundation
import Combine

class FightPresenter {
    private let fightService: FightService
    private var cancellables = Set<AnyCancellable>()

    var myHealth: Int = 0
    var enemyHealth: Int = 0

    init(fightService: FightService) {
        self.fightService = fightService
        setupSubscribers()
    }

    private func setupSubscribers() {
        fightService.myHealth
            .sink { [weak self] myHealth in
                self?.myHealth = myHealth
            }
            .store(in: &cancellables)

        fightService.enemyHealth
            .sink { [weak self] enemyHealth in
                self?.enemyHealth = enemyHealth
            }
            .store(in: &cancellables)
    }

    func startFight() {
        fightService.startFight()
    }

    func basicAttack() {
        fightService.basicAttack()
    }

    func magicAttack() {
        fightService.magicAttack()
    }
}

