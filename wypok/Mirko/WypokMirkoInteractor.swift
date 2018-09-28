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
    
    init(service: MirkoService, prefetchingService: PrefetchingService) {
        self.service = service
        self.prefetchingService = prefetchingService
    }
    
    //todo: not implemented
    //todo: BASE SERVICE IS HERE LOLOLOL
    func getMirkoRecents(and successClosure: @escaping MirkoInteractor.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure) {
        fatalError("not implemented")
    }
    
    //todo: BASE SERVICE IS HERE LOLOLOL
    func getMirkoHots(and successClosure: @escaping MirkoInteractor.ItemsFetchedClosure, fetchDidFailed failureClosure: @escaping WypokBaseService.ServiceFailureClosure) {
        service.getMirkoHots(
            for: currentPage,
            and: 6,
            and: { dtos in
                let models = dtos.flatMap({ dto in dto.map() })
                let previewImageUrls = models
                    .filter({ (model) -> Bool in return model.embed != nil })
                    .map({ (model) -> String in return model.embed!.previewImageUrl })
                self.prefetchingService.prefetch(
                    from: previewImageUrls,
                    and: {
                        self.currentPage += 1
                        successClosure(models)
                }, prefetchDidFailed: { error in
                    failureClosure(.generalError(error))
                })
        }, fetchDidFailed:  { error in
            //todo: should map to some local error type (i guess)
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
    
//    private func map(_ entity: MirkoEntity, to model: inout MirkoItemModel) {
//
//    }
}
