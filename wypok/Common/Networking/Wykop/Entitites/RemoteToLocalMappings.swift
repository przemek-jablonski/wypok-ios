//
//  RemoteToLocalMappings.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 09/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

fileprivate typealias EmbedTypeDto = String

extension MirkoItemDto {
    func map() -> MirkoItemModel {
        return MirkoItemModel(id: id, content: body, embed: embed?.map(), authorName: author, authorAvatarUrl: authorAvatarBig, authorSexMale: authorSex == "male", authorRank: authorGroup.mapToAuthorRank(), application: app, date: Date(), under18Restriction: embed?.plus18 ?? false, commentCount: commentCount, upvoteCount: voteCount, comments: comments.map({ dto in
            dto.map()
        }))
    }
}

extension MirkoCommentDto {
    func map() -> MirkoCommentModel {
        return MirkoCommentModel(id: id, author: mapUserData(), date: Date(), body: body, parentEntryId: entryId, upvoteCount: voteCount, embed: embed?.map())
    }
    
    func mapUserData() -> UserModel {
        return UserModel(name: author, avatarUrl: authorAvatarBig, authorRank: authorGroup.mapToAuthorRank(), authorSex: authorSex.mapToAuthorSexModel())
    }
}

extension EmbedDto {
    func map() -> EmbedModel {
        let typemodel = type.mapToEmbedTypeModel()
        return EmbedModel(contentType: type.mapToEmbedTypeModel(), previewImageUrl: preview, contentUrl: url, under18RestrictedFlag: plus18)
    }
}

extension FrontPageItemDto {
    func map() -> FrontPageItemModel {
        return T(id: id, title: title.removeHtmlEntities(), description: descriptionField.removeHtmlEntities(), itemUrl: url, itemSourceUrl: sourceUrl, previewImageUrl: preview, upvoteCount: voteCount, commentCount: commentCount, reportsCount: reportCount)
    }
}

fileprivate extension Int {
    func mapToAuthorRank() -> AuthorRankModel {
        switch self {
        case 0: return .green
        case 1: return .orange
        case 2: return .red
        case 5: return .admin
        case 1001: return .inactive
        case 1002: return .inactive
        default : return .unknown
        }
    }
}

fileprivate extension String {
    func mapToEmbedTypeModel() -> EmbedTypeModel {
        switch self {
        case "image": return .image
        case "video": return .video
        default: return .undefined
        }
    }
    func mapToAuthorSexModel() -> AuthorSexModel {
        switch self {
        case "male": return .male
        case "female": return .female
        default: return .undefined
        }
    }
}
