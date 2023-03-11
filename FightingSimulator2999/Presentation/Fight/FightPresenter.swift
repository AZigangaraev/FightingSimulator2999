//
//  FighPresenter.swift
//  FightingSimulator2999
//
//  Created by Лада on 11.03.2023.
//

import UIKit

class FightPresenter {
    init( mainService: FightService, view: MainView ) {
        self.mainService = mainService
        self.view = view
    }
    
    private var mainService: FightService!
    private weak var view: MainView?
//      private var confirmFigh: () -> Void = {}
    
    @MainActor
    func startFight() {
        view?.showLoader()
//        do {
//            try await mainService.startFight
////            myHealth.health = 100
////            enemyHealth.health = 100
//        } catch {
//            view?.show(error: error)
//        }
    }
    
    @MainActor
    func basicAttack() {
        do {
            try mainService.basicAttack()
            view?.basicAttackTap()
//            enemyHealth.health -= 9
//            myHealth.health -= 10
        } catch {
            view?.show(error: error)
        }
    
    }
    
    @MainActor
    func magicAttack() {
        do {
            try mainService.magicAttack()
            view?.magicAttackTap()
//            enemyHealth.health -= 12 // Enemy.random()
//            myHealth.health -= 10
        } catch {
            view?.show(error: error)
        }
    }

}
