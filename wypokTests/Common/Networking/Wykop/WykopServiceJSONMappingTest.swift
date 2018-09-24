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
    var mirkoHotPageFixtures: [[JSON]]! = nil
    var mirkoSingleEntriesWithCommentsFixtures: [JSON]! = nil
    var frontPagePromotedFixture1: [JSON]! = nil
    
    override func setUp() {
        super.setUp()
        do {
            if (mirkoHotPageFixtures == nil) {
            mirkoHotPageFixtures = try [
                getJSONArrayFixture(fromFile: "mirko_hots_6h_fixture_1"),
                getJSONArrayFixture(fromFile: "mirko_hots_6h_fixture_2"),
                getJSONArrayFixture(fromFile: "mirko_hots_6h_fixture_3")
            ]
            }
            if (mirkoSingleEntriesWithCommentsFixtures == nil) {
            mirkoSingleEntriesWithCommentsFixtures = try [
                getJSONFixture(fromFile: "mirko_single_entry_with_comments_fixture_1"),
                getJSONFixture(fromFile: "mirko_single_entry_with_comments_fixture_2"),
                getJSONFixture(fromFile: "mirko_single_entry_with_comments_fixture_3"),
                getJSONFixture(fromFile: "mirko_single_entry_with_comments_fixture_4"),
                getJSONFixture(fromFile: "mirko_single_entry_with_comments_fixture_5")
            ]
            }
            if (frontPagePromotedFixture1 == nil) {
            frontPagePromotedFixture1 = try getJSONArrayFixture(fromFile: "frontpage_promoted_fixture_1")
            }
        } catch {
            fatalError()
        }
    }
    
    func test_frontPagePromoted_shouldParseToModelArrayWithNoRuntimeFailure() {
        let dtos = frontPagePromotedFixture1.map { jsonElement in FrontPageItemDto(fromJson: jsonElement) }
        let model = dtos.map { dto in dto.map() }
    }
    
    func test_mirkoHotPage_shouldParseToModelArrayWithNoRuntimeFailure() {
        mirkoHotPageFixtures.forEach { jsonArray in
            let dtos = jsonArray.map { jsonElement in MirkoItemDto(fromJson: jsonElement) }
            dtos.map { dto in dto.map() }
        }
    }
    
    func test_mirkoEntry_shouldParseToModelWithNoRuntimeFailure() {
        mirkoSingleEntriesWithCommentsFixtures.map { json in
            MirkoItemDto(fromJson: json).map()
        }
    }
    
    private func getJSONArrayFixture(fromFile name: String) throws -> [JSON] {
        return try getJSONFixture(fromFile: name).array!
    }
    
    private func getJSONFixture(fromFile name: String) throws -> JSON {
        return try JSON(data: NSData(contentsOfFile: Bundle(for: WykopServiceJSONMappingTests.self).path(forResource: name, ofType: "json")!)! as Data)
    }
}
