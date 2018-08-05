//
//  FrontPageArticleTableViewCell.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 05/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit

class FrontPageArticleTableViewCell: UITableViewCell {

    static let XIB_FILENAME = "FrontPageArticleTableViewCell"
    static let REUSE_IDENTIFIER = "FrontPageArticleTableViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    func updateContents(titleText: String, linkText: String, upvoteCount: Int, commentCount: Int, dateText: String) {
        titleLabel.text = titleText
    }
    
    
}
