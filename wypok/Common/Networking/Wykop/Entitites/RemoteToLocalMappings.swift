//
//  RemoteToLocalMappings.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 09/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation

extension MirkoItemDto {
    
    func map() -> MirkoItemModel {
        let embedModel: EmbedModel?
        //todo: why UNDEFINED and NIL-storing object is not null?
        if (embed != nil && embed!.type != MirkoEmbedType.UNDEFINED) {
            embedModel = EmbedModel(contentType: getEmbedTypeModel(embed!.type), previewImageUrl: embed!.preview, contentUrl: embed!.url, under18RestrictedFlag: embed!.plus18)
        } else {
            embedModel = nil
        }
        
        return MirkoItemModel(id: id, content: body, embed: embedModel, authorName: author, authorAvatarUrl: authorAvatarBig, authorSexMale: authorSex == "male", authorRank: AuthorRankModel.map(from: authorGroup), application: app, date: Date(), under18Restriction: embed?.plus18 ?? false, commentCount: commentCount, upvoteCount: voteCount)
    }
    
    //todo: this is fucked up
    private func getEmbedTypeModel(_ embedType: MirkoEmbedType) -> EmbedTypeModel {
        switch(embedType) {
        case .IMAGE:
            return EmbedTypeModel.IMAGE
        case .VIDEO:
            return EmbedTypeModel.VIDEO
        case .UNDEFINED:
            return EmbedTypeModel.UNDEFINED
        }
    }
    
}

extension FrontPageItemDto {
    
    func map() -> FrontPageItemModel {
        return T(id: id, title: title.removeHtmlEntities(), description: descriptionField.removeHtmlEntities(), itemUrl: url, itemSourceUrl: sourceUrl, previewImageUrl: preview, upvoteCount: voteCount, commentCount: commentCount, reportsCount: reportCount)
    }
    
}
