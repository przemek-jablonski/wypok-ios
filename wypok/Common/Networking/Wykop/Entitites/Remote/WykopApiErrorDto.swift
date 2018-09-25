//
//  WykopApiError.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 25/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

struct WykopApiErrorDto {
    let error: ErrorDto
}

struct ErrorDto {
    let code: WykopApiErrorCode
    let message: String
}

