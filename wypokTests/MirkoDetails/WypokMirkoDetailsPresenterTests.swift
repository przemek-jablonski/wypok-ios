//
//  MirkoDetailsPresenterTests.swift
//  wypokTests
//
//  Created by Przemyslaw Jablonski on 23/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import XCTest
@testable import wypok

class WypokMirkoDetailsPresenterTests: XCTestCase {

    private let mirkoDetailsInteractorSucceeding: MirkoDetailsInteractor
    private let mirkoDetailsInteractorFailing: MirkoDetailsInteractor
    private var mirkoDetailsPresenter: WypokMirkoDetailsPresenter!
    
    override init() {
        mirkoDetailsInteractorSucceeding = MirkoDetailsInteractorMockSucceeding()
        mirkoDetailsInteractorFailing = MirkoDetailsInteractorMockFailing()
        super.init()
    }
    
    override func setUp() {
        mirkoDetailsPresenter.onSelectedEntryIdReceived(Random.int())
    }

    override func tearDown() {
    }
    
    private func test_uponReceivingEntryId_shouldReturn() {
//        mirkoDetailsPresenter = WypokMirkoDetailsPresenter(interactor: mirkoDetailsInteractorSucceeding)
//        mirkoDetailsPresenter?.onSelectedEntryIdReceived(<#T##id: Int##Int#>)
//        mirkoDetailsPresenter?.attach(<#T##view: View##View#>)
    }
    

}

fileprivate class MirkoDetailsInteractorMockSucceeding: MirkoDetailsInteractor {
    
    func getMirkoItemDetails(for itemId: Int, fetchDidSucceed successClosure: @escaping MirkoDetailsInteractor.ItemFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        successClosure(MirkoItemModel(id: Random.int(), content: Random.string(by: .UUID), embed: nil, authorName: Random.string(by: .UUID), authorAvatarUrl: Random.string(by: .UUID), authorSexMale: Random.bool(), authorRank: .admin, application: Random.string(by: .UUID), date: Random.date(), under18Restriction: Random.bool(), commentCount: Random.int(), upvoteCount: Random.int(), comments: nil))
    }
}

fileprivate class MirkoDetailsInteractorMockFailing: MirkoDetailsInteractor {
    func getMirkoItemDetails(for itemId: Int, fetchDidSucceed successClosure: @escaping MirkoDetailsInteractor.ItemFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        failureClosure(GenericError())
    }
}

fileprivate class GenericError: Error {}
