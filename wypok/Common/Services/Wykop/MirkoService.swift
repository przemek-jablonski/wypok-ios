//
//  MirkoService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

protocol MirkoService {
    
    func getMirkoRecents(response: @escaping ([MirkoItemDto]) -> ())
    
    func getMirkoHots(response: @escaping ([MirkoItemDto]) -> ())
    
}
