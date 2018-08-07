//
//  WypokFrontPageInteractor.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokFrontPageInteractor: FrontPageInteractor {
    
    private let frontPageService: FrontPageService = WypokService()
    
    func getFrontPageItems(with completion: @escaping ([FrontPageItemModel]) -> ()) {
        frontPageService.getLinksPromoted(response: { dtos in
            completion(dtos.map({ dto in dto.mapToLocal()}))
        })
    }
    
    func fetchImagesForFrontPageItems(frontPageItems: [FrontPageItemModel], completionHandler: @escaping ([FrontPageItemModel]) -> ()) {
        //        frontPageItems.forEach { (model) in
        //            frontPageService.getImage(from: model.itemSourceUrl, response: { data in
        //
        //            })
        //        }
    }
    
}
