//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Эльвира Самигуллина on 11.03.2023.
//

import UIKit

class FightPresenter {
    
    var fightService: FightService = MockFightService.shared
    weak var view: FightViewController?
    
    func basicAttacked() {
        fightService.basicAttack()
        view?.progressUpdate(myHealth: fightService.getMyHealth(),
                             enemyHealth: fightService.getEnemyHealth())
    }
    
    func magicAttacked() {
        fightService.magicAttack()
        view?.progressUpdate(myHealth: fightService.getMyHealth(),
                             enemyHealth: fightService.getEnemyHealth())
    }
}
