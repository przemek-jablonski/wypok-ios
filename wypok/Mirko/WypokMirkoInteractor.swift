//
//  WypokMirkoInteractor.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokMirkoInteractor: MirkoInteractor {
    //todo: maybe service should be part of some baseInteractor? this will be everywhere anyway
    private let service: MirkoService = WypokService() //todo: violation of DI
    
    func getMirkoRecents(and action: @escaping MirkoInteractor.ItemsFetchedClosure) {
        service.getMirkoRecents { dtos in
            action(dtos.map({ dto in dto.mapToLocal()}))
        }
    }
    
    func getMirkoHots(and action: @escaping MirkoInteractor.ItemsFetchedClosure) {
        service.getMirkoHots { dtos in
            action(dtos.map({ dto in dto.mapToLocal()}))
        }
    }
    
    
}
