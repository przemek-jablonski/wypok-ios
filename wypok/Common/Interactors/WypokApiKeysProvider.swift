//
//  WypokApiKeysProvider.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

class WypokApiKeysProvider: ApiKeysProvider {
    
    private static let APIKEYS_PLIST_FILE_NAME = "ApiKeys"
    private static let APIKEYS_PLIST_FILE_EXTENSION = "plist"
    private static let APIKEYS_APIKEY_DICTIONARY_KEY = "WYPOK_APIKEY"
    private static let APIKEYS_SECRET_DICTIONARY_KEY = "WYPOK_SECRET"
    
    private lazy var apiKeysDictionary: NSDictionary = { getApiKeysDictionary() }()
    
    func getApiKey() -> String {
        return apiKeysDictionary.value(forKey: WypokApiKeysProvider.APIKEYS_APIKEY_DICTIONARY_KEY) as! String
    }
    
    func getMd5Hash(from url: String) -> String {
        return getMd5Hash(from: url, with: "")
    }
    
    func getMd5Hash(from url: String, with post: String = "") -> String {
        return (getSecret() + url + post).utf8.md5.rawValue
    }
    
    private func getSecret() -> String {
        return apiKeysDictionary.value(forKey: WypokApiKeysProvider.APIKEYS_SECRET_DICTIONARY_KEY) as! String
    }
    
    private func getApiKeysDictionary() -> NSDictionary {
        //TODO: remove !s
        return NSDictionary(contentsOfFile: Bundle.main.path(forResource: WypokApiKeysProvider.APIKEYS_PLIST_FILE_NAME, ofType: WypokApiKeysProvider.APIKEYS_PLIST_FILE_EXTENSION)!)!
    }
    
}
