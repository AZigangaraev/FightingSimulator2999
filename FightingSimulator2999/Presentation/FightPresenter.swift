//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Rafael Shamsutdinov on 11.03.2023.
//

import Foundation
import Combine

class FightPresenter {
    private let fightModel: FightService
    private var cancellables = Set<AnyCancellable>()
    var coordinator: FightCoordinator?
    var myHealth: AnyPublisher<Int, Never> {
        fightModel.myHealth
    }

    var enemyHealth: AnyPublisher<Int, Never> {
        fightModel.enemyHealth
    }

    weak var delegate: FightPresenterDelegate?

    init(fightService: FightService) {
        self.fightModel = fightService
        
    }

    func viewDidLoad() {
        fightModel.startFight()
        checkGameState()
    }

    func didTapBasicAttack() {
        fightModel.basicAttack()
        checkGameState()
    }

    func didTapMagicAttack() {
        fightModel.magicAttack()
        checkGameState()
    }

    private func checkGameState() {
        myHealth
            .combineLatest(enemyHealth)
            .sink { myHealth, enemyHealth in
                if myHealth <= 0 {
                    print("lose")
                    self.delegate?.playerDidLose()
                } else if enemyHealth <= 0 {
                    print("win")
                    self.delegate?.enemyDidLose()
                }
            }
            .store(in: &cancellables)
    }
}

protocol FightPresenterDelegate: AnyObject {
    func playerDidLose()
    func enemyDidLose()
}
