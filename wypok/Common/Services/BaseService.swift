//
//  WypokBaseService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class BaseService {
    
    private static let WYKOP_API_BASE_URL = "https://a.wykop.pl"
    private static let WYKOP_API_PARAMETERS_SUFFIX_KEY = "/appkey,"
    private static let WYKOP_API_REQUEST_HEADER_MD5HASH_KEY = "apisign"
    
    private lazy var apiKeysProvider: ApiKeysProvider = {
        return WypokApiKeysProvider()
    }()
    
    
    func performServiceCall<T: RemoteEntity>(urlSuffix: String, response: @escaping ([T]) -> ()){
        performServiceCall(for: urlSuffix, responseHandler: { data in
            response(self.parseServiceCallResponseToJsonArray(from: data).map({json in T(fromJson: json)}))
        })
    }
    
//    func performServiceCall<T: RemoteEntity>(for urlSuffix: String, responseHandlerModel response: @escaping (T) -> ()){
//        performServiceCall(for: urlSuffix, responseHandler: { data in
//            response(T(fromJson: self.parseServiceCallResponseToJson(from: data)))
//        })
//    }
    
    private func performServiceCall(for urlSuffix: String, responseHandler: @escaping (DataResponse<Any>) -> ()){
        constructServiceCall(for: urlSuffix)
            .responseJSON { dataResponse in responseHandler(dataResponse)}
    }
    
    private func constructServiceCall(for urlSuffix: String) -> DataRequest {
        return constructServiceCall(for: urlSuffix, with: apiKeysProvider.getApiKey())
    }
    
    private func constructServiceCall(for urlSuffix: String, with apiKey: String) -> DataRequest {
        let requestUrl = BaseService.WYKOP_API_BASE_URL + urlSuffix + BaseService.WYKOP_API_PARAMETERS_SUFFIX_KEY + apiKey
        let requestMd5Hash = apiKeysProvider.getMd5Hash(from: requestUrl)
        print("constructServiceCall, requestUrl: \(requestUrl)")
        return Alamofire
            .request(requestUrl, headers: [BaseService.WYKOP_API_REQUEST_HEADER_MD5HASH_KEY : requestMd5Hash])
            .validate()
    }
    
    
    //todo: service maintenance (aktualizacja serwisu) case is not handled (it will break here since it will respond with XML code, not JSON)
    private func parseServiceCallResponseToJson(from dataResponse: DataResponse<Any>) -> JSON {
        return try! JSON(data: dataResponse.data!)
    }
    
    private func parseServiceCallResponseToJsonArray(from dataResponse: DataResponse<Any>)-> [JSON] {
        return try! JSON(data: dataResponse.data!).array!
    }
    
}