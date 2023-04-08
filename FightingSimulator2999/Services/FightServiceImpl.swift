//
//  FightServiceImpl.swift
//  FightingSimulator2999
//
//  Created by Илья on 11.03.2023.
//

import Foundation
import Combine

class FightServiceImpl: FightService {
    var myHealth: AnyPublisher<Int, Never> {
        return myHealthSubject.eraseToAnyPublisher()
    }
    var enemyHealth: AnyPublisher<Int, Never> {
        return enemyHealthSubject.eraseToAnyPublisher()
    }

    private var myHealthSubject = CurrentValueSubject<Int, Never>(100)
    private var enemyHealthSubject = CurrentValueSubject<Int, Never>(100)

    func startFight() {
        myHealthSubject.send(100)
        enemyHealthSubject.send(100)
    }

    func basicAttack() {
        enemyHealthSubject.send(max(enemyHealthSubject.value - 9, 0))
        myHealthSubject.send(max(myHealthSubject.value - 10, 0))
    }

    func magicAttack() {
        let damage = Int.random(in: 7...15)
        enemyHealthSubject.send(max(enemyHealthSubject.value - damage, 0))
        myHealthSubject.send(max(myHealthSubject.value - 10, 0))
    }
}

