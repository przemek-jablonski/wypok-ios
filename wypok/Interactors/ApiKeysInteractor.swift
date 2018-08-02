//
//  ApiKeysProvider.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 03/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//


protocol ApiKeysInteractor {
    
    func getApiKey() -> String
    
    func getMd5Hash(from url: String) -> String
    
    func getMd5Hash(from url: String, with post: String) -> String
    
}
