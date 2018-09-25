//
//  WykopServiceError.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 25/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

//todo: this should be more generic
//todo: like ServiceError + _ code: ApiErrorCode etc...
enum WykopServiceError {
    case apiError(_ code: WykopApiErrorCode, _ message: String)
    case generalError(_ error: Error)
}
