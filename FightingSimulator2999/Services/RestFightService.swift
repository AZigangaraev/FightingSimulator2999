//
//  RestFightService.swift
//  FightingSimulator2999
//
//  Created by Artyom Mitrofanov on 11.03.2023.
//

import Foundation
import Combine


class RestFightService: FightService {
    
    static let shared: RestFightService = .init()
    
    var _myHealth: CurrentValueSubject<Int, Never> = .init(100)
    
    var _enemyHealth: CurrentValueSubject<Int, Never> = .init(100)
    
    var myHealth: AnyPublisher<Int, Never> {
        return _myHealth.eraseToAnyPublisher()
    }
    
    var enemyHealth: AnyPublisher<Int, Never> {
        _enemyHealth.eraseToAnyPublisher()
    }
    
    func startFight() {
        _myHealth.send(100)
        _enemyHealth.send(100)
    }
    
    func basicAttack() {
        _enemyHealth.value -= 9
        _myHealth.value -= 10
    }
    
    func magicAttack() {
        _enemyHealth.value -= Int.random(in: 7...15)
        _myHealth.value -= 10
    }
    
    
}
