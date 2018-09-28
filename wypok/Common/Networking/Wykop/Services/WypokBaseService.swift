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
                let errorFound = self.findAndHandleWykopApiErrors(from: data, ifFails: failureClosure)
                if (!errorFound) {
                    successClosure((try receivedData.parseServiceCallResponseToJsonArray()).mapToRemoteEntity())
                }
            } catch {
                failureClosure(.generalError(error))
            }
        }
    }
    
    func performServiceCall<T: RemoteEntity>(for urlSuffix: String, callDidSucceed successClosure: @escaping GenericSingleItemFetchedClosure<T>, callDidFailed failureClosure: @escaping ServiceFailureClosure){
        performServiceCall(for: urlSuffix) { data in
            do {
                let json = try data.parseServiceCallResponseToJson()
                let errorFound = self.findAndHandleWykopApiErrors(from: data, ifFails: failureClosure)
                if (!errorFound) {
                    successClosure(T(fromJson: json))
                }
            } catch {
                failureClosure(.generalError(error))
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
    
    private func findAndHandleWykopApiErrors(from rawData: DataResponse<Any>, ifFails failureClosure: @escaping ServiceFailureClosure) -> Bool {
        do {
            let json = try rawData.parseServiceCallResponseToJson()
            return findAndHandleWykopApiErrors(from: json, ifFails: failureClosure)
        } catch {
            failureClosure(.generalError(ResponseDataParsingError()))
            return true
        }
    }
    
    private func findAndHandleWykopApiErrors(from rawJson: JSON, ifFails failureClosure: @escaping ServiceFailureClosure) -> Bool {
        if (!rawJson.containsWykopApiError()) {
            return false
        } else {
            failureClosure(determineWykopApiError(from: rawJson))
            return true
        }
    }
    
    private func determineWykopApiError(from rawJson: JSON) -> WykopServiceError {
        guard let errorCode = WykopApiErrorCode.init(rawValue: rawJson.getWykopApiErrorCode())
            else {
                return .generalError(InvalidApiErrorCodeError())
        }
        return .apiError(errorCode, rawJson.getWykopApiErrorMessage())
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
    
    func getWykopApiErrorCode() -> Int {
        return self["error"]["code"].intValue
    }
    
    func getWykopApiErrorMessage() -> String? {
        return self["error"]["message"].string
    }
}

fileprivate extension Array where Element == JSON {
    
    func mapToRemoteEntity<T: RemoteEntity>() -> [T] {
        return self.map({ json in T(fromJson: json) })
    }
    
}
