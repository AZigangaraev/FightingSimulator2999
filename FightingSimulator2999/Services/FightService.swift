//
//  FightService.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import Foundation
import Combine

struct Enemy {
    var health: Int
}

protocol FightService {
    var myHealth: AnyPublisher<Int, Never> { get }
    var enemyHealth: AnyPublisher<Int, Never> { get }
    /// Restores player and enemy health to 100
    func startFight()
    /// Deals 9 damage to enemy. Enemy attacks back and reduces `myHealth` by 10.
    func basicAttack()
    /// Deals 7-15 damage. Enemy attacks back and reduces `myHealth` by 10.
    func magicAttack()
}


class FightModel: FightService {
    private var enemy: Enemy = Enemy(health: 100)
    private var myCurrentHealth = CurrentValueSubject<Int, Never>(100)
    private var enemyCurrentHealth = CurrentValueSubject<Int, Never>(100)

    var myHealth: AnyPublisher<Int, Never> {
        myCurrentHealth.eraseToAnyPublisher()
    }

    var enemyHealth: AnyPublisher<Int, Never> {
        enemyCurrentHealth.eraseToAnyPublisher()
    }

    func startFight() {
        enemy.health = 100
        myCurrentHealth.send(100)
        enemyCurrentHealth.send(100)
    }

    func basicAttack() {
        enemy.health -= 9
        enemyCurrentHealth.send(enemy.health)
        if enemy.health <= 0 {
            // enemy is defeated
        } else {
            // enemy attacks back
            myCurrentHealth.send(myCurrentHealth.value - 10)
        }
    }

    func magicAttack() {
        let damage = Int.random(in: 7...15)
        enemy.health -= damage
        enemyCurrentHealth.send(enemy.health)

        if enemy.health <= 0 {
            // enemy is defeated
        } else {
            // enemy attacks back
            myCurrentHealth.send(myCurrentHealth.value - 10)
        }
    }
}
