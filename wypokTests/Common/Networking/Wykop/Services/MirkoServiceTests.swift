//
//  MirkoServiceTests.swift
//  wypokTests
//
//  Created by Przemyslaw Jablonski on 24/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import XCTest
@testable import wypok

class MirkoServiceTests: XCTestCase {

    private static let MIRKO_ITEM_ID_INVALID = 35446772
    private static let MIRKO_ITEM_ID_VALID = 35405573
    
    private let service: MirkoService = WypokService(apiKeysProvider: WypokApiKeysProvider())
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_getMirkoRecents_negativePageIndex_producesFailure() {
        
    }
    
    func test_getMirkoHots_negativePageIndex_producesSuccess() {
        
    }
    
    func test_getMirkoItemWithComments_invalidId_producesFailure() {
        let id = MirkoServiceTests.MIRKO_ITEM_ID_INVALID
        let expectation = self.expectation(description: "Failure closure called")
        
        service.getMirkoItemWithComments(
            for: id,
            and: { dto in
                XCTFail("Success closure called")
        }) { error in
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_getMirkoItemWithComments_validId_producessSuccess() {
        let id = MirkoServiceTests.MIRKO_ITEM_ID_VALID
        let expectation = self.expectation(description: "Success closure called")
        
        service.getMirkoItemWithComments(
            for: id,
            and: { dto in
                XCTAssert(dto != nil, "returned dto is nil")
                XCTAssert(dto is MirkoItemDto, "returned dto is not MirkoItemDto")
                XCTAssert(dto.id! == id, "returned dto's id is not equal to input id")
                XCTAssert(dto.author == "Kulturalny_Jegomosc90")
                XCTAssert(dto.authorAvatar == "https://www.wykop.pl/cdn/c3397992/Kulturalny_Jegomosc90_yMdRZVS8WG,q60.jpg")
                XCTAssert(dto.authorAvatarBig == "https://www.wykop.pl/cdn/c3397992/Kulturalny_Jegomosc90_yMdRZVS8WG,q150.jpg")
                XCTAssert(dto.authorSex == "male")
                XCTAssert(dto.date == "2018-09-22 22:52:02")
                XCTAssert(dto.url == "https://www.wykop.pl/wpis/35405573/dobranoc-dzienne-wykopki-dobranoc-sobotawieczor-so/")
                XCTAssert(dto.voteCount == 0)
                XCTAssert(dto.userVote == 0)
                XCTAssert(dto.commentCount == 0)
                expectation.fulfill()
        }) { error in
            XCTFail("Failure closure called")
        }
        waitForExpectations(timeout: 2, handler: nil)
    }
    
}
