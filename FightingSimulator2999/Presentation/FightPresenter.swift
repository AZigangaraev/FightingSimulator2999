//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Artyom Mitrofanov on 11.03.2023.
//

import Foundation
import Combine

class FightPresenter {
    
    var fightService: FightService = RestFightService.shared
    var myHealth: AnyPublisher <Int, Never> {fightService.myHealth}
    var enemyHealth: AnyPublisher <Int, Never> {fightService.enemyHealth}
    weak var fightPresenter: FightPresenter?
    
    weak var view: FightViewController!
    
    func startFight() {
        fightService.startFight()
    }

    @MainActor
    func basicAttack() {
        view?.attack()
        view?.getAttacked()
        fightService.basicAttack()
    }
    
    @MainActor
    func magicAttack() {
        view?.attack()
        view?.getAttacked()
        fightService.magicAttack()
    }    
}
