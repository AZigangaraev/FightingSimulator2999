//
//  RestFightService.swift
//  FightingSimulator2999
//
//  Created by Alsu Faizova on 11.03.2023.
//

import Foundation
import Combine

class RestFightService: FightService {
    var _myHealth: CurrentValueSubject<Int, Never> = .init(100)
    var _enemyHealth: CurrentValueSubject<Int, Never> = .init(100)

    var myHealth: AnyPublisher<Int, Never> { _myHealth.eraseToAnyPublisher() }
    var enemyHealth: AnyPublisher<Int, Never> { _enemyHealth.eraseToAnyPublisher() }

    var startFightCalled: Bool = false
    var basicAttackCalled: Bool = false
    var magicAttackCalled: Bool = false

    func startFight() {
        startFightCalled = true
    }

    func basicAttack() -> (Int, Int) {
        _myHealth.value -= 10
        _enemyHealth.value -= 9
        
        if(_myHealth.value <= 0) {
            showResult(Result.lose)
        }
        if(_enemyHealth.value <= 0) {
            showResult(Result.win)
        }
        return (_myHealth.value, _enemyHealth.value)
    }

    func magicAttack() -> (Int, Int) {
        
        _myHealth.value -= 10
        _enemyHealth.value -= Int.random(in: 7..<16)
        
        if(_myHealth.value <= 0) {
            showResult(Result.lose)
        }
        if(_enemyHealth.value <= 0) {
            showResult(Result.win)
        }
        return (_myHealth.value, _enemyHealth.value)
    }

    func showResult(_ winner: Result) {
        return
        
    }
}
