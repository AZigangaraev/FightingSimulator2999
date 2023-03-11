//
//  FightingSimulator2999Tests.swift
//  FightingSimulator2999Tests
//
//  Created by Teacher on 11.03.2023.
//

import XCTest
@testable import FightingSimulator2999

final class FightingSimulator2999Tests: XCTestCase {
    var fightService: FightService!
    
    func testExample() throws {
        //Act
        let (me, enemy) = fightService.basicAttack()

        //Assert
        XCTAssertEqual(me, 90)
        XCTAssertEqual(enemy, 91)
    }
}
