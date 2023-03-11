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


class MyMockFightService: FightService{
    var _myHealth: CurrentValueSubject<Int, Never> = .init(100)
    var _enemyHealth: CurrentValueSubject<Int, Never> = .init(100)

    var myHealth: AnyPublisher<Int, Never> { _myHealth.eraseToAnyPublisher() }
    var enemyHealth: AnyPublisher<Int, Never> { _enemyHealth.eraseToAnyPublisher() }

    var isEnemyAlive = true
    var isMeAlive = true
    func isAlive(health: CurrentValueSubject<Int, Never>) -> Bool{
        return health.value > 0
    }
    
    func startFight() {
        _myHealth.value = 100
        _enemyHealth.value = 100
    }
    
    func basicAttack() {
        _enemyHealth.value -= 9
        if !isAlive(health: _enemyHealth){
            self.isEnemyAlive = false
        }
        _myHealth.value -= 10
        if !isAlive(health: _myHealth){
            self.isMeAlive = false
        }
        
    }
    
    func magicAttack() {
        _enemyHealth.value -= Int.random(in: 7...15)
        if !isAlive(health: _enemyHealth){
            self.isEnemyAlive = false
        }
        _myHealth.value -= 10
        if !isAlive(health: _myHealth){
            self.isMeAlive = false
        }
    }
    
    
}
