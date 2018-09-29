//
//  WypokMirkoDetailsPresenterTests.swift
//  wypokTests
//
//  Created by Przemyslaw Jablonski on 29/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import XCTest
@testable import wypok

class WypokMirkoDetailsPresenterTests: XCTestCase {
    
    private var interactorGetMirkoItemDetailsMock: GetMirkoItemDetailsMock!
    private var viewRenderMock: RenderMock!
    private let MOCK_ITEM_ID = -1
    
    private var presenter: MirkoDetailsPresenter {
        get {
            let presenter = WypokMirkoDetailsPresenter(interactor: MirkoDetailsInteractorMock(getMirkoItemDetailsMock: interactorGetMirkoItemDetailsMock))
            presenter.attach(ViewMock(renderMock: viewRenderMock))
            return presenter
        }
    }

    func test_whenNoPresenterActionCalled_shouldGenerateLoadingOnly() {
        let promise = self.expectation(description: "view's render method called with loading")
        
        interactorGetMirkoItemDetailsMock = { _, _, _ in }
        
        viewRenderMock = { viewState in
            XCTAssert(viewState is WypokMirkoDetailsViewState)
            switch viewState as! WypokMirkoDetailsViewState {
            case .loading:
                promise.fulfill()
            default:
                XCTFail("viewState type is not .loading ((\(viewState)")
            }
        }
        
        let presenter = WypokMirkoDetailsPresenter(interactor: MirkoDetailsInteractorMock(getMirkoItemDetailsMock: interactorGetMirkoItemDetailsMock))
        presenter.attach(ViewMock(renderMock: viewRenderMock))
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func test_whenAnyPresenterActionCalled_shouldGenerateLoadingAndAnyState() {
        let renderLoadingPromise = self.expectation(description: "view's render method called with loading")
        let renderAnyViewStatePromise = self.expectation(description: "view's render method called with any argument aside loading")
        
        interactorGetMirkoItemDetailsMock = { _, fetchDidSucceed, _ in
            fetchDidSucceed(MirkoItemModel.generateMock())
        }
        
        viewRenderMock = { viewState in
            XCTAssert(viewState is WypokMirkoDetailsViewState)
            switch viewState as! WypokMirkoDetailsViewState {
            case .loading:
                renderLoadingPromise.fulfill()
            default:
                renderAnyViewStatePromise.fulfill()
            }
        }
        
        presenter.onSelectedEntryIdReceived(MOCK_ITEM_ID)
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    

    func test_onSelectedEntryIdReceived_whenInteractorFetchSucceedes_shouldGenerateContent() {
        let renderContentPromise = self.expectation(description: "view's render method called with .content")
        
        interactorGetMirkoItemDetailsMock = { _, fetchDidSucceed, _ in
            fetchDidSucceed(MirkoItemModel.generateMock(id: self.MOCK_ITEM_ID))
            
        }
        
        viewRenderMock = { viewState in
            XCTAssert(viewState is WypokMirkoDetailsViewState)
            switch viewState as! WypokMirkoDetailsViewState {
            case .content(let model):
                XCTAssert(model.id == self.MOCK_ITEM_ID)
                renderContentPromise.fulfill()
                break
            case .loading:
                break //ignore
            default:
                XCTFail("viewState type is not .content ((\(viewState)")
            }
        }
        
        presenter.onSelectedEntryIdReceived(MOCK_ITEM_ID)
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func test_onSelectedEntryIdReceived_whenInteractorTimeout_shouldGenerateLoadingOnly() {
        let renderLoadingPromise = self.expectation(description: "view's render method called with .loading")
        
        interactorGetMirkoItemDetailsMock = { _, _, _ in }
        
        viewRenderMock = { viewState in
            XCTAssert(viewState is WypokMirkoDetailsViewState)
            switch viewState as! WypokMirkoDetailsViewState {
            case .loading:
                renderLoadingPromise.fulfill()
            default:
                XCTFail("viewState type is not .loading ((\(viewState)")
            }
        }
        
        presenter.onSelectedEntryIdReceived(MOCK_ITEM_ID)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func test_onSelectedEntryIdReceived_whenInteractorFetchFails_withApiError_shouldGenerateError() {
        let errorCode = WykopApiErrorCode.commentRemovedOrDoesNotExist
        let renderErrorPromise = self.expectation(description: "view's render method called with .error")
        
        interactorGetMirkoItemDetailsMock = { _, _, fetchDidFailed in
            fetchDidFailed(MirkoDetailsInteractorError.apiError(errorCode, nil))
        }
        
        viewRenderMock = { viewState in
            XCTAssert(viewState is WypokMirkoDetailsViewState)
            switch viewState as! WypokMirkoDetailsViewState {
            case .error(let message):
                XCTAssertNotNil(message)
                renderErrorPromise.fulfill()
                break
            case .loading:
                break //ignore
            default:
                XCTFail("viewState type is not .error (\(viewState))")
            }
        }
        
        presenter.onSelectedEntryIdReceived(MOCK_ITEM_ID)
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func test_whenInteractorFails_withApiError_shouldGenerateCorrectErrorMessage() {
        let errorCode = WykopApiErrorCode.commentRemovedOrDoesNotExist
        let renderErrorPromise = self.expectation(description: "view's render method called with .error")
        
        interactorGetMirkoItemDetailsMock = { _, _, fetchDidFailed in
            fetchDidFailed(MirkoDetailsInteractorError.apiError(errorCode, nil))
        }
        
        viewRenderMock = { viewState in
            XCTAssert(viewState is WypokMirkoDetailsViewState)
            switch viewState as! WypokMirkoDetailsViewState {
            case .error(let message):
                XCTAssertNotNil(message)
                XCTAssert(message == String(errorCode.rawValue))
                renderErrorPromise.fulfill()
                break
            case .loading:
            break //ignore
            default:
                XCTFail("viewState type is not .error (\(viewState))")
            }
        }
        
        presenter.onSelectedEntryIdReceived(MOCK_ITEM_ID)
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func test_whenInteractorFails_withUnknownApiError_shouldGenerateCorrectErrorMessage() {
        let renderErrorPromise = self.expectation(description: "view's render method called with .error")
        
        interactorGetMirkoItemDetailsMock = { _, _, fetchDidFailed in
            fetchDidFailed(MirkoDetailsInteractorError.undefinedApiError(ResponseDataParsingError()))
        }
        
        viewRenderMock = { viewState in
            XCTAssert(viewState is WypokMirkoDetailsViewState)
            switch viewState as! WypokMirkoDetailsViewState {
            case .error(let message):
                XCTAssertNotNil(message)
                XCTAssert(message.isNotBlank)
                renderErrorPromise.fulfill()
                break
            case .loading:
            break //ignore
            default:
                XCTFail("viewState type is not .error (\(viewState))")
            }
        }
        
        presenter.onSelectedEntryIdReceived(MOCK_ITEM_ID)
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func test_whenInteractorFails_withGeneralError_shouldGenerateCorrectErrorMessage() {
        let renderErrorPromise = self.expectation(description: "view's render method called with .error")
        
        interactorGetMirkoItemDetailsMock = { _, _, fetchDidFailed in
            fetchDidFailed(MirkoDetailsInteractorError.generalError(nil))
        }
        
        viewRenderMock = { viewState in
            XCTAssert(viewState is WypokMirkoDetailsViewState)
            switch viewState as! WypokMirkoDetailsViewState {
            case .error(let message):
                XCTAssertNil(message)
                renderErrorPromise.fulfill()
                break
            case .loading:
            break //ignore
            default:
                XCTFail("viewState type is not .error (\(viewState))")
            }
        }
        
        presenter.onSelectedEntryIdReceived(MOCK_ITEM_ID)
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }

}

fileprivate typealias GetMirkoItemDetailsMock = ((Int, MirkoDetailsInteractor.ItemFetchedClosure, MirkoDetailsInteractor.FetchingFailureClosure) -> ())

fileprivate class MirkoDetailsInteractorMock: MirkoDetailsInteractor {

    private let getMirkoItemDetailsMock: GetMirkoItemDetailsMock

    init(getMirkoItemDetailsMock: @escaping GetMirkoItemDetailsMock) {
        self.getMirkoItemDetailsMock = getMirkoItemDetailsMock
    }
    
    func getMirkoItemDetails(
        for itemId: Int,
        fetchDidSucceed successClosure: @escaping ItemFetchedClosure,
        fetchDidFailed failureClosure: @escaping FetchingFailureClosure) {
        getMirkoItemDetailsMock(itemId, successClosure, failureClosure)
    }

}

fileprivate typealias RenderMock = ((ViewState) -> ())

fileprivate class ViewMock: View {
    
    private let renderMock: RenderMock
    
    init(renderMock: @escaping RenderMock) {
        self.renderMock = renderMock
    }
    
    func render(_ viewState: ViewState) {
        renderMock(viewState)
    }
}

extension MirkoItemModel {
    
    static func generateMock() -> MirkoItemModel {
        return generateMock(id: Random.int())
    }
    
    static func generateMock(id: Int) -> MirkoItemModel {
        return MirkoItemModel(
            id: id,
            content: Random.string(),
            embed: nil,
            authorName: Random.string(),
            authorAvatarUrl: Random.string(),
            authorSexMale: Random.bool(),
            authorRank: AuthorRankModel.admin,
            application: Random.string(),
            date: Random.date(),
            under18Restriction: Random.bool(),
            commentCount: Random.int(),
            upvoteCount: Random.int(),
            comments: nil
        )
    }
    
}
