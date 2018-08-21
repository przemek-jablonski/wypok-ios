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
    private let service: MirkoService
    private let repository: MirkoEntityRepository
    
    init(service: MirkoService, repository: MirkoEntityRepository) {
        self.service = service
        self.repository = repository
    }
    
    convenience init() {
        self.init(service: WypokGlobalInjectionContainer.get(MirkoService.self), repository: WypokGlobalInjectionContainer.get(MirkoEntityRepository.self))
    }
    
    func getMirkoRecents(and action: @escaping MirkoInteractor.ItemsFetchedClosure) {
        service.getMirkoRecents { dtos in
            action(dtos.map({ dto in dto.mapToLocal()}))
        }
    }
    
    func getMirkoHots(and action: @escaping MirkoInteractor.ItemsFetchedClosure) {
        service.getMirkoHots { dtos in
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
            self.repository.get(with: { (entities) in
                print("entities: \(entities)")
                for (index, entity) in entities.enumerated() {
                    print("entity[\(index)]: \(entity), \(entity.application) \(entity.authorAvatarUrl) \(entity.upvoteCount) \(entity.commentCount)")
                }
            })
        }
    }
    
    
}
