//
//  FightPresenter.swift
//  FightingSimulator2999
//
//  Created by Daniil Chemaev on 11.03.2023.
//

import UIKit

class FightPresenter {
    init(
        fightService: FightService,
        view: FightViewController
    ) {
        self.fightService = fightService
        self.view = view
    }

    private var fightService: FightService!
    private weak var view: FightViewController?


    func basicAttack() {
        fightService.basicAttack()
    }
}
