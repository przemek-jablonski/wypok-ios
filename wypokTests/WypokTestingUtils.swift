//
//  WypokTestingUtils.swift
//  wypokTests
//
//  Created by Przemyslaw Jablonski on 29/09/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
@testable import wypok


//MARK: View

internal typealias RenderMock = ((ViewState) -> ())

internal class ViewMock: View {
    
    private let renderMock: RenderMock
    
    init(renderMock: @escaping RenderMock) {
        self.renderMock = renderMock
    }
    
    func render(_ viewState: ViewState) {
        renderMock(viewState)
    }
}

//MARK: Models

internal extension MirkoItemModel {
    
    static func generateMock() -> MirkoItemModel {
        return generateMock(id: Random.int())
    }
    
    static func generateMock(id: Int) -> MirkoItemModel {
        return MirkoItemModel(
            id: id,
            content: Random.string(),
            embed: nil,
            authorName: Random.string(),
            authorAvatarUrl: Random.string(),
            authorSexMale: Random.bool(),
            authorRank: AuthorRankModel.admin,
            application: Random.string(),
            date: Random.date(),
            under18Restriction: Random.bool(),
            commentCount: Random.int(),
            upvoteCount: Random.int(),
            comments: nil
        )
    }
    
}
