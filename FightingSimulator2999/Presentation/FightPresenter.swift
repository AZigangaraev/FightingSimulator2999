//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Илья on 11.03.2023.
//

import Foundation
import Combine

protocol FightViewPresenterProtocol {
    var myHealth: AnyPublisher<Int, Never> { get }
    var enemyHealth: AnyPublisher<Int, Never> { get }
    var cancellables: Set<AnyCancellable> { get set }
    func startFight()
    func basicAttack()
    func magicAttack()
}

class FightViewPresenter: FightViewPresenterProtocol {
    private let service: FightService
    var cancellables = Set<AnyCancellable>()

    var myHealth: AnyPublisher<Int, Never> {
        return service.myHealth
    }

    var enemyHealth: AnyPublisher<Int, Never> {
        return service.enemyHealth
    }

    init(service: FightService) {
        self.service = service
    }

    func startFight() {
        service.startFight()
    }

    func basicAttack() {
        service.basicAttack()
    }

    func magicAttack() {
        service.magicAttack()
    }
    
    deinit {
        cancellables.removeAll()
    }

}

