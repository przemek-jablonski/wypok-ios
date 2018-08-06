//
//  BaseService.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 06/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import Alamofire

protocol BaseService {
    
    func getImage(from urlString: String, response: @escaping (Data) -> ())
    
}
