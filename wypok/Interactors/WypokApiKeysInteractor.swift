//
//  WypokApiKeysInteractor.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokApiKeysInteractor: ApiKeysInteractor {
    
    
    static let APIKEYS_PLIST_FILE_NAME = "ApiKeys"
    static let APIKEYS_PLIST_FILE_EXTENSION = "plist"
    static let APIKEYS_APIKEY_DICTIONARY_KEY = "WYPOK_APIKEY"
    static let APIKEYS_SECRET_DICTIONARY_KEY = "WYPOK_SECRET"
    
    private lazy var apiKeysDictionary: NSDictionary = { getApiKeysDictionary() }()
    
    func getApiKey() -> String {
        return apiKeysDictionary.value(forKey: WypokApiKeysInteractor.APIKEYS_APIKEY_DICTIONARY_KEY) as! String
    }
    
    func getMd5Hash(from url: String) -> String {
        return getMd5Hash(from: url, with: "")
    }
    
    func getMd5Hash(from url: String, with post: String = "") -> String {
        return (getSecret() + url + post).utf8.md5.rawValue
    }
    
    private func getSecret() -> String {
        return apiKeysDictionary.value(forKey: WypokApiKeysInteractor.APIKEYS_SECRET_DICTIONARY_KEY) as! String
    }
    
    private func getApiKeysDictionary() -> NSDictionary {
        //TODO: remove !s
        return NSDictionary(contentsOfFile: Bundle.main.path(forResource: WypokApiKeysInteractor.APIKEYS_PLIST_FILE_NAME, ofType: WypokApiKeysInteractor.APIKEYS_PLIST_FILE_EXTENSION)!)!
    }
    
}
