//
//  MirkoDetailsInteractorTestUtils.swift
//  wypokTests
//
//  Created by Przemyslaw Jablonski on 29/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
@testable import wypok

//MARK: MirkoDetails: Interactor

internal typealias GetMirkoItemDetailsMock = ((Int, MirkoDetailsInteractor.ItemFetchedClosure, MirkoDetailsInteractor.FetchingFailureClosure) -> ())

internal class MirkoDetailsInteractorMock: MirkoDetailsInteractor {
    
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


//MARK: MirkoDetails: Service



//internal class MirkoServiceMock: MirkoService {
//
//
//
//    func getMirkoRecents(for page: Int, and successClosure: @escaping Self.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure) {
//        <#code#>
//    }
//
//    func getMirkoHots(for page: Int, and period: Int, and successClosure: @escaping Self.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure) {
//        <#code#>
//    }
//
//    func getMirkoItemWithComments(for id: Int, and successClosure: @escaping Self.ItemFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure) {
//        <#code#>
//    }
//
//
//
//
//}
