//
//  ConfirmPresent.swift
//  FightingSimulator2999
//
//  Created by Лада on 11.03.2023.
//

import Foundation

class ConfirmPresenter {
    init(mainService: FightService) {
        self.mainService = mainService
    }

    private let mainService: FightService

    func confirm() {
        Task {
            await mainService.confirmFigh()
        }
    }
}
