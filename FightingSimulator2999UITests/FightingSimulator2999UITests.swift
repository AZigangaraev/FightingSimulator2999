//
//  FightingSimulator2999UITests.swift
//  FightingSimulator2999UITests
//
//  Created by Teacher on 11.03.2023.
//

import XCTest

final class FightingSimulator2999UITests: XCTestCase {
    override func setUp() {
        let app = XCUIApplication()
        app.launch()
        self.app = app
    }
    
    var app: XCUIApplication!

    func testShowButton() throws {
        let button = app.buttons["Basic attack"]
        
        XCTAssertTrue(button.exists)
    }
}
