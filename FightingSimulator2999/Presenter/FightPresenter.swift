//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Радмир Фазлыев on 11.03.2023.
//

//import Foundation
//import Combine
//
//protocol FightView: AnyObject {
//    func updateMyHealth(health: Float)
//    func updateEnemyHealth(health: Float)
//    func showResult(_ result: ResultViewController.Result)
//}
//
//class FightPresenter {
//    private let fightService: FightService
//    weak private var view: FightView?
//
//    private var cancellables = Set<AnyCancellable>()
//
//    init(fightService: FightService) {
//        self.fightService = fightService
//    }
//
//    func attachView(_ view: FightView) {
//        self.view = view
//
//        // Subscribe to the health updates and update the view
//        fightService.myHealth
//            .map { Float($0) / 100 }
//            .sink { [weak self] health in
//                self?.view?.updateMyHealth(health: health)
//            }
//            .store(in: &cancellables)
//
//        fightService.enemyHealth
//            .map { Float($0) / 100 }
//            .sink { [weak self] health in
//                self?.view?.updateEnemyHealth(health: health)
//            }
//            .store(in: &cancellables)
//    }
//
//    func detachView() {
//        self.view = nil
//        cancellables.removeAll()
//    }
//
//    func basicAttack() {
//        fightService.basicAttack()
//    }
//
//    func magicAttack() {
//        fightService.magicAttack()
//    }
//}

import Foundation
import Combine

class FightPresenter {
    private let service: FightService
    private var cancellables: Set<AnyCancellable> = []

    var myHealth: AnyPublisher<Float, Never> {
        return service.myHealth.map { Float($0) / 100 }.eraseToAnyPublisher()
    }

    var enemyHealth: AnyPublisher<Float, Never> {
        return service.enemyHealth.map { Float($0) / 100 }.eraseToAnyPublisher()
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
}
