//
//  IGListKitMirkoModelDiffingTest.swift
//  wypokTests
//
//  Created by Przemyslaw Jablonski on 01/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import XCTest
import Foundation
import IGListKit
@testable import wypok

class IGListKitMirkoModelDiffingTest: XCTestCase {
    
    private var topmostModelId = 0
    
    private var emptyList: [MirkoItemModel]? = nil
    private var filledList: [MirkoItemModel]? = nil
    private var updatedList: [MirkoItemModel]? = nil
    private var uniqueList: [MirkoItemModel]? = nil
    
    override func setUp() {
        super.setUp()
        emptyList = generateEmptyList()
        filledList = generateFilledList()
        updatedList = generateUpdatedList(with: filledList!)
        uniqueList = generateUniqueList()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_diffingEmptyListWithFilled_shouldReportChanges() {
        XCTAssertTrue(ListDiffPaths(fromSection: 0, toSection: 0, oldArray: emptyList!, newArray: filledList!, option: .equality).hasChanges)
    }
    
    func test_diffingFilledListWithUpdated_shouldReportChanges() {
        XCTAssertTrue(ListDiffPaths(fromSection: 0, toSection: 0, oldArray: filledList!, newArray: updatedList!, option: .equality).hasChanges)
    }
    
    func test_diffingFilledListWithUpdated_shouldReportInsertedIndexes_andNoUpdatedAndDeletedIndexes() {
        let result = ListDiffPaths(fromSection: 0, toSection: 0, oldArray: filledList!, newArray: updatedList!, option: .equality)
        result.forBatchUpdates()
        XCTAssertTrue(result.inserts.count == updatedList!.count - filledList!.count)
        XCTAssertTrue(result.updates.count == 0)
        XCTAssertTrue(result.deletes.count == 0)
    }
    
    func test_diffingUpdatedListWithFilled_shouldReportRemovedIndexes_andNoInsertedAndUpdatedIndexes() {
        let result = ListDiffPaths(fromSection: 0, toSection: 0, oldArray: updatedList!, newArray: filledList!, option: .equality)
        result.forBatchUpdates()
        XCTAssertTrue(result.inserts.count == 0)
        XCTAssertTrue(result.updates.count == 0)
        XCTAssertTrue(result.deletes.count == updatedList!.count - filledList!.count)
    }
    
    func test_diffingUpdatedListWithUnique_shouldReportChanges() {
        XCTAssertTrue(ListDiffPaths(fromSection: 0, toSection: 0, oldArray: updatedList!, newArray: uniqueList!, option: .equality).hasChanges)
    }
    
    func test_diffingUpdatedListWithUnique_shouldReportUpdatedIndexes() {
        let result = ListDiffPaths(fromSection: 0, toSection: 0, oldArray: updatedList!, newArray: uniqueList!, option: .equality)
        result.forBatchUpdates()
        XCTAssertTrue(result.inserts.count == min(updatedList!.count, uniqueList!.count))
        XCTAssertTrue(result.updates.count == 0)
        XCTAssertTrue(result.deletes.count == max(updatedList!.count, uniqueList!.count))
    }
    
    
    
    
    private func generateEmptyList() -> [MirkoItemModel] {
        return [MirkoItemModel]()
    }
    
    private func generateFilledList() -> [MirkoItemModel] {
        return generateRandomMirkoItemModels()
    }
    
    private func generateUpdatedList(with oldList: [MirkoItemModel]) -> [MirkoItemModel] {
        var models = [MirkoItemModel]()
        models.append(contentsOf: oldList)
        models.append(contentsOf: generateRandomMirkoItemModels())
        return models
    }
    
    private func generateUniqueList() -> [MirkoItemModel] {
        return generateRandomMirkoItemModels()
    }
    
    private func generateRandomMirkoItemModels() -> [MirkoItemModel] {
        var models = [MirkoItemModel]()
        for _ in 0...abs(Int32(arc4random_uniform(100))) { models.append(generateRandomMirkoItemModel()) }
        return models
    }
    
    private func generateRandomMirkoItemModel() -> MirkoItemModel {
        topmostModelId += 1
        return MirkoItemModel(id: topmostModelId, content: NSUUID().uuidString, embed: nil, authorName: NSUUID().uuidString, authorAvatarUrl: NSUUID().uuidString, authorSexMale: arc4random_uniform(2) == 0, authorRank: AuthorRank.ADMIN, application: NSUUID().uuidString, date: Date(), under18Restriction: arc4random_uniform(2) == 0, commentCount: Int(arc4random()), upvoteCount: Int(arc4random()))
    }
}
