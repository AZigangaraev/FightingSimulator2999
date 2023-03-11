//
//  FightingSimulator2999Tests.swift
//  FightingSimulator2999Tests
//
//  Created by Teacher on 11.03.2023.
//

import XCTest
@testable import FightingSimulator2999

final class FightingSimulator2999Tests: XCTestCase {
    let fightService = MockFightService()
    func testAttackWorks() throws {
        fightService.basicAttack()
        XCTAssertTrue(fightService.basicAttackCalled)
    }
}
