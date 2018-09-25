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

class WypokBaseService {
    
    typealias GenericSingleItemFetchedClosure <T: RemoteEntity> = (T) -> ()
    typealias GenericItemsFetchedClosure <T: RemoteEntity> = ([T]) -> ()
    typealias ServiceFailureClosure = (WykopServiceError) -> ()
    typealias DataResponseFetchedClosure = (DataResponse<Any>) -> ()
    
    private static let WYKOP_API_BASE_URL = "https://a.wykop.pl"
    private static let WYKOP_API_PARAMETERS_SUFFIX_KEY = "/appkey,"
    private static let WYKOP_API_REQUEST_HEADER_MD5HASH_KEY = "apisign"
    
    private let wypokApiKeysProvider: ApiKeysProvider
    
    init(apiKeysProvider: ApiKeysProvider) {
        self.wypokApiKeysProvider = apiKeysProvider
    }
    
    //todo: this should be an array (<T : [RemoteEntity]>)
    func performServiceCall<T: RemoteEntity>(for urlSuffix: String, callDidSucceed successClosure: @escaping GenericItemsFetchedClosure<T>, callDidFailed failureClosure: @escaping ServiceFailureClosure){
        performServiceCall(for: urlSuffix) { data in
            do {
                let receivedData = data
                let parsedData: [JSON] = try receivedData.parseServiceCallResponseToJsonArray()
                let mappedData = parsedData.map({json in T(fromJson: json)})
                successClosure(mappedData)
            } catch {
                failureClosure(WykopServiceError.generalError(error)) //todo: service maintenance (aktualizacja serwisu) case is not handled really (it will break here since it will respond with XML code, not JSON)
            }
        }
    }
    
    func performServiceCall<T: RemoteEntity>(for urlSuffix: String, callDidSucceed successClosure: @escaping GenericSingleItemFetchedClosure<T>, callDidFailed failureClosure: @escaping ServiceFailureClosure){
        performServiceCall(for: urlSuffix) { data in
            do {
                let json = try data.parseServiceCallResponseToJson()
                if (json.containsWykopApiError()) {
//                    failureClosure()
                } else {
                    successClosure(T(fromJson: json))
                }
            } catch {
//                failureClosure(error)
                //todo: service maintenance (aktualizacja serwisu) case is not handled really (it will break here since it will respond with XML code, not JSON)
            }
        }
        
    }
    
    private func performServiceCall(for urlSuffix: String, callDidSucceed successClosure: @escaping DataResponseFetchedClosure){
        constructServiceCall(for: urlSuffix, with: wypokApiKeysProvider.getApiKey()).responseJSON { dataResponse in successClosure(dataResponse)}
    }
    
    private func constructServiceCall(for urlSuffix: String, with apiKey: String) -> DataRequest {
        let requestUrl = WypokBaseService.WYKOP_API_BASE_URL + urlSuffix + WypokBaseService.WYKOP_API_PARAMETERS_SUFFIX_KEY + apiKey
        let requestMd5Hash = wypokApiKeysProvider.getMd5Hash(from: requestUrl)
        print("serviceCall: \(requestUrl)")
        return Alamofire
            .request(requestUrl, headers: [WypokBaseService.WYKOP_API_REQUEST_HEADER_MD5HASH_KEY : requestMd5Hash])
            .validate()
    }
    
}

fileprivate extension DataResponse where Value == Any {
    func parseServiceCallResponseToJson() throws -> JSON {
        return try JSON(data: self.data!)
    }
    
    func parseServiceCallResponseToJsonArray() throws -> [JSON] {
        return try JSON(data: self.data!).array!
    }
}

fileprivate extension JSON {
    
    func containsWykopApiError() -> Bool {
        return self["error"] != JSON.null
    }
    
}
