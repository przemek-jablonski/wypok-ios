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
    
    //todo: maybe service should be part of some baseInteractor? this will be everywhere anywa. The same for the repository (probably?)
    private let service: MirkoService
    
    //todo: why two initializers?
    init(service: MirkoService) {
        self.service = service
    }
    
    convenience init() {
        self.init(service: WypokGlobalInjectionContainer.get(MirkoService.self))
    }
    
    func getMirkoRecents(and successClosure: @escaping MirkoInteractor.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        service.getMirkoRecents(and: { dtos in
            successClosure(dtos.map({ (dto) -> MirkoItemModel in
                return self.map(dto)
            }))
        }, fetchDidFailed: { error in
            failureClosure(error)
        })
    }
    
    func getMirkoHots(and successClosure: @escaping MirkoInteractor.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        service.getMirkoHots(and: { dtos in
            successClosure(dtos.map({ (dto) -> MirkoItemModel in
                return self.map(dto)
            }))
        }, fetchDidFailed: { error in
            failureClosure(error)
        })
    }
    
    
    private func map(_ dto: MirkoItemDto, to entity: inout MirkoEntity) {
        entity.id = Int64(dto.id)
        entity.application = dto.app ?? ""
        entity.authorAvatarUrl = dto.authorAvatarBig
        entity.authorName = dto.author
        entity.authorSexMale = dto.authorSex == "male"
        entity.commentCount = Int32(dto.commentCount)
        entity.date = NSDate()
        entity.under18Restriction = dto.embed?.plus18 ?? false
        entity.upvoteCount = Int32(dto.voteCount)
    }
    
    private func map(_ entity: MirkoEntity, to model: inout MirkoItemModel) {
        
    }
    
    //todo: to be deleted when repository will be in place
    private func map(_ dto: MirkoItemDto) -> MirkoItemModel {
        return dto.mapToLocal()
    }
    
    
}
