//
//  WykopServiceJSONMappingTest.swift
//  wypokTests
//
//  Created by Przemyslaw Jablonski on 12/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation


import Foundation
import XCTest
import SwiftyJSON
@testable import wypok

class WykopServiceJSONMappingTests: XCTestCase {
    
    //todo: those jsons should be DATA instead
    //todo: then, there can be DATA -> [JSON] parsing tests
    //todo: which can fail with this project since Backend is sending some XML file when service is down (lolz?) 
    var mirkoHotPageFixture1: [JSON]!
    var mirkoHotPageFixture2: [JSON]!
    var frontPagePromotedFixture1: [JSON]!
    
    override func setUp() {
        super.setUp()
        do {
            mirkoHotPageFixture1 = try getJSONFixture(fromFile: "mirko_hots_6h_fixture_1")
            mirkoHotPageFixture2 = try getJSONFixture(fromFile: "mirko_hots_6h_fixture_2")
            frontPagePromotedFixture1 = try getJSONFixture(fromFile: "frontpage_promoted_fixture_1")
        } catch {
            fatalError()
        }
    }
    
    func test_frontPagePromoted_shouldParseToModelArrayWithNoRuntimeFailure() {
        let dtos = frontPagePromotedFixture1.map { jsonElement in FrontPageItemDto(fromJson: jsonElement) }
        let model = dtos.map { dto in dto.map() }
    }
    
    func test_mirkoHotPage_shouldParseToModelArrayWithNoRuntimeFailure_1() {
        let dtos = mirkoHotPageFixture1.map { jsonElement in MirkoItemDto(fromJson: jsonElement) }
        let model = dtos.map { dto in dto.map() }
    }
    
    func test_mirkoHotPage_shouldParseToModelArrayWithNoRuntimeFailure_2() {
        let dtos = mirkoHotPageFixture2.map { jsonElement in MirkoItemDto(fromJson: jsonElement) }
        let model = dtos.map { dto in dto.map() }
    }
    
    private func getJSONFixture(fromFile name: String) throws -> [JSON] {
        return try JSON(data: NSData(contentsOfFile: Bundle(for: WykopServiceJSONMappingTests.self).path(forResource: name, ofType: "json")!)! as Data).array!
    }
}
