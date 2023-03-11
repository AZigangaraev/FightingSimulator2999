//
//  MockFightService.swift
//  FightingSimulator2999
//
//  Created by Эльвира Самигуллина on 11.03.2023.
//

import Combine

class MockFightService: FightService {
    static let shared: MockFightService = .init()
    
    var _myHealth: CurrentValueSubject<Int, Never> = .init(100)
    var _enemyHealth: CurrentValueSubject<Int, Never> = .init(100)
    
    var myHealth: AnyPublisher<Int, Never> { _myHealth.eraseToAnyPublisher() }
    var enemyHealth: AnyPublisher<Int, Never> { _enemyHealth.eraseToAnyPublisher() }
    
    /// Restores player and enemy health to 100
    func startFight() {
        _myHealth.value = 100
        _enemyHealth.value = 100
    }
    
    /// Deals 9 damage to enemy. Enemy attacks back and reduces `myHealth` by 10.
    func basicAttack() {
        _enemyHealth.value -= 9
        _myHealth.value -= 10
    }
    
    /// Deals 7-15 damage. Enemy attacks back and reduces `myHealth` by 10.
    func magicAttack() {
        _enemyHealth.value = _enemyHealth.value - Int.random(in: 7...15)
        _myHealth.value -= 10
    }
    
    func getMyHealth() -> Int {
        return _myHealth.value
    }
    
    func getEnemyHealth() -> Int {
        return _enemyHealth.value
    }
}
