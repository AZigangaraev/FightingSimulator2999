//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Alsu Faizova on 11.03.2023.
//

import UIKit

class FightPresenter {
    init(
        fightService: FightService,
        view: FightViewController
    ){
        self.fightService = fightService
        self.view = view
    }
    private var fightService: FightService = RestFightService()
    private weak var view: FightViewController?
    
    var showResult: (Result) -> Void = { _ in }

    func startFight() {
        fightService.startFight()
    }

    func basicAttack() -> (Int, Int) {
        return fightService.basicAttack()
    }

    func magicAttack() -> (Int, Int) {
        return fightService.magicAttack()
    }
    
    func openResult(winner: Result) {
        showResult(winner)
    }
}
