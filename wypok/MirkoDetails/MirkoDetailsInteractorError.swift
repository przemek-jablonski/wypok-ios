//
//  MirkoDetailsInteractorError.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 29/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

enum MirkoDetailsInteractorError {
    case apiError(_ code: WykopApiErrorCode, _ message: String?)
    case undefinedApiError(Error)
    case generalError(Error?)
}
