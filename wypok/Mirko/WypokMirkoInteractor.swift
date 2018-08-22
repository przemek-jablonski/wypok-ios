//
//  WypokMirkoInteractor.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 11/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

//todo: improvement - view protocol should be named Renderer? Because that's what it does

class WypokMirkoInteractor: MirkoInteractor {
    
    //todo: maybe service should be part of some baseInteractor? this will be everywhere anyway
    private let service: MirkoService
    private let repository: MirkoEntityRepository
    
    //todo: why two initializers?
    init(service: MirkoService, repository: MirkoEntityRepository) {
        self.service = service
        self.repository = repository
    }
    
    convenience init() {
        self.init(service: WypokGlobalInjectionContainer.get(MirkoService.self), repository: WypokGlobalInjectionContainer.get(MirkoEntityRepository.self))
    }
    
    func getMirkoRecents(and action: @escaping MirkoInteractor.ItemsFetchedClosure) {
        service.getMirkoRecents(and: { dtos in
            action(dtos.map({ dto in dto.mapToLocal()}))
        }, fetchDidFailed: {_ in
            
        })
    }
    
    func getMirkoHots(and action: @escaping MirkoInteractor.ItemsFetchedClosure) {
        service.getMirkoHots(and: { dtos in
            let mapped = dtos.map({ dto in dto.mapToLocal()})
            action(mapped)
            self.repository.put(models: mapped, and: { (model, entity) -> () in
                entity.application = model.application ?? ""
                entity.authorAvatarUrl = model.authorAvatarUrl
                entity.authorName = model.authorName
                entity.authorSexMale = model.authorSexMale
                entity.commentCount = Int32(model.commentCount)
                entity.date = NSDate()
                entity.under18Restriction = model.under18Restriction
                entity.upvoteCount = Int32(model.upvoteCount)
            })
            //todo: tutej get
        }, fetchDidFailed: {_ in
            
        })
    }
    
    
}
