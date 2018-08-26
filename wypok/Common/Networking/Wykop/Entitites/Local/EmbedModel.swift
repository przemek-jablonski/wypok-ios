//
//  MirkoEmbedModel.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 27/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

class EmbedModel {
    
    let contentType: EmbedTypeModel
    let previewImageUrl: String
    let contentUrl: String
    let under18RestrictedFlag: Bool
    
    init(contentType: EmbedTypeModel, previewImageUrl: String, contentUrl: String, under18RestrictedFlag: Bool) {
        self.contentType = contentType
        self.previewImageUrl = previewImageUrl
        self.contentUrl = contentUrl
        self.under18RestrictedFlag = under18RestrictedFlag
    }
    
}
