//
//  WypokExtensionsTests.swift
//  wypokTests
//
//  Created by Przemyslaw Jablonski on 28/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import XCTest
@testable import wypok

class WypokExtensionsTests: XCTestCase {
    
    let nullString: String? = nil
    let emptyString = ""
    let emptyString2 = String()
    let whitespaceString = " "
    let oneCharString = "a"
    let loremIpsumString = "Lorem Ipsum"
    let urlString = "https://x-team.com/blog/how-to-get-started-with-ios-unit-tests-in-swift/"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_nullString_shouldReturnTrueOnIsBlank() {
        XCTAssertTrue(nullString.isBlank)
    }
    
    func test_emptyStrings_shouldReturnTrueOnIsBlank() {
        XCTAssertTrue(emptyString.isBlank)
        XCTAssertTrue(emptyString2.isBlank)
    }
    
    func test_whitespaceString_shouldReturnFalseOnIsBlank() {
        XCTAssertFalse(whitespaceString.isBlank)
    }
    
    func test_filledStrings_shouldReturnFalseOnIsBlank() {
        XCTAssertFalse(oneCharString.isBlank)
        XCTAssertFalse(loremIpsumString.isBlank)
        XCTAssertFalse(urlString.isBlank)
    }
    
    func test_nullString_shouldReturnFalseOnIsNotBlank() {
        XCTAssertFalse(nullString.isNotBlank)
    }
    
    func test_emptyStrings_shouldReturnFalseOnIsNotBlank() {
        XCTAssertFalse(emptyString.isNotBlank)
        XCTAssertFalse(emptyString2.isNotBlank)
    }
    
    func test_whitespaceString_shouldReturnTrueOnIsNotBlank() {
        XCTAssertTrue(whitespaceString.isNotBlank)
    }
    
    func test_filledStrings_shouldReturnTrueOnIsNotBlank() {
        XCTAssertTrue(oneCharString.isNotBlank)
        XCTAssertTrue(loremIpsumString.isNotBlank)
        XCTAssertTrue(urlString.isNotBlank)
    }
    
}
