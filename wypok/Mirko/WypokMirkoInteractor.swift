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
    private let prefetchingService: PrefetchingService
    private var currentPage = 1
    
    //todo: why two initializers?
    init(service: MirkoService, prefetchingService: PrefetchingService) {
        self.service = service
        self.prefetchingService = prefetchingService
    }
    
    convenience init() {
        self.init(service: WypokGlobalInjectionContainer.get(MirkoService.self), prefetchingService: WypokGlobalInjectionContainer.get(PrefetchingService.self))
    }
    
    func getMirkoRecents(and successClosure: @escaping MirkoInteractor.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
    }
    
    func getMirkoHots(and successClosure: @escaping MirkoInteractor.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping CommonFailureClosure) {
        print("getMirkoHots, currentPage: \(currentPage)")
        service.getMirkoHots(
            for: currentPage,
            and: 6,
            and: { dtos in
                let models = dtos.map({ (dto) -> MirkoItemModel in return self.map(dto) })
                let previewImageUrls = models
                    .filter({ (model) -> Bool in return model.embed != nil })
                    .map({ (model) -> String in return model.embed!.previewImageUrl })
                self.prefetchingService.prefetch(
                    from: previewImageUrls,
                    and: {
                        self.currentPage += 1
                        successClosure(models)
                }, prefetchDidFailed: { error in
                    failureClosure(error)
                })
        }, fetchDidFailed:  { error in
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
