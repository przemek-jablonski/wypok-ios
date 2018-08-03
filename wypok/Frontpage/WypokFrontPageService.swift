//
//  WypokFrontPageService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import Alamofire

class WypokFrontPageService: WypokBaseService, FrontPageService {
    
    func getLinksPromoted(response: @escaping ([FrontPageItemDto]) -> ()) {
        performServiceCall(for: "/links/promoted", responseHandlerModelArray: { (dtos :[FrontPageItemDto]) -> () in response(dtos)
        })
    }
    
    
//    func getLinksPromoted() -> [FrontPageItemDto] {
//        performServiceCall(for: <#T##String#>, responseHandlerJson: <#T##(JSON) -> ()#>)
////        Alamofire
//////            .request
////            .request("https://a.wykop.pl/links/promoted/appkey,\(apiKeysInteractor.getApiKey())", headers: ["apisign" : "\(apiKeysInteractor.getMd5Hash(from: "https://a.wykop.pl/links/promoted/appkey,\(apiKeysInteractor.getApiKey())"))"])
////            .validate()
////            .responseJSON { response in
////                var items: [FrontPageItemDto?] = [FrontPageItemDto]()
////                var mappedItems: [FrontPageItemModel] = [FrontPageItemModel]()
////                if let data = response.data {
////                    items = (try! JSON(data: data).array?.map{jsonObject in FrontPageItemDto(fromJson: jsonObject)})!
////                    mappedItems = items.map({dto in
////                        dto!.map()
////                    })
////                }
////                print("items: \(items)")
////                print("mapped: \(items)")
////        }
//    }
    
    
}
