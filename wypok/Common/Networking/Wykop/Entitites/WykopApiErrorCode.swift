//
//  WykopServiceError.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 25/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

enum WykopApiErrorCode: Int {
    case invalidApiKey = 1
    case invalidParams = 2
    case notEnoughMandatoryParameters = 3
    case noWritePermission = 4
    case dailyRequestLimitExceeded = 5
    case requestSignatureInvalid = 6
    case noPermissionForThisOperation = 7
    case invalidUserKey = 11
    case emptyOrInvalidUserKey = 12
    case userNotFound = 13
    case invalidLoginCredentials = 14
    case loginOrPasswordFieldNotFound = 15
    case IPBannedException = 17
    case AccoundBannedException = 18
    case cantVoteForOwnComments = 31
    case invalidEntryId = 32
    case cantObserveThemselves = 33
    case cantEditComment = 34
    case cantEditEntry = 35
    case entryWasRemoved = 41
    case entryIsPrivate = 42
    case entryDoesNotExist = 61
    case tooShortSearchQuery = 71
    case commentRemovedOrDoesNotExist = 81
    case invalidRequest = 999
    case apiDown = 1001
    case invalidQueryMethod = 1002
    case invalidApiErrorCode = 9999
}
