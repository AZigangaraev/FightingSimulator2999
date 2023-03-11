//
//  FightService.swift
//  FightingSimulator2999
//
//  Created by Teacher on 11.03.2023.
//

import UIKit
import Combine

struct Enemy {
    var health: Int
//    let numberOfHealth: Int
//
//    private static func random() -> Int {
//        numberOfHealth: Int.random(in: 7...15)
//    }
}

protocol FightService {
    var myHealth: AnyPublisher<Int, Never> { get }
    var enemyHealth: AnyPublisher<Int, Never> { get }
    
    /// Восстанавливает здоровье игрока и врага до 100
    func startFight()
    /// Наносит врагу 9 единиц урона. Враг атакует в ответ и уменьшает "мое здоровье" на 10.
    func basicAttack()
    /// Наносит 7-15 единиц урона. Враг атакует в ответ и уменьшает "мое здоровье" на 10.
    func magicAttack()
}
