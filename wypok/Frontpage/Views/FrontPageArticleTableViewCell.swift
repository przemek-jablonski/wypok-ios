//
//  FrontPageArticleTableViewCell.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 05/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit
import SDWebImage

//todo: naming mismatch, it should be WYPOKFrontTableViewCell
class FrontPageArticleTableViewCell: WypokTableViewCell {
    
    override class var XIB_FILENAME: String { return "FrontPageArticleTableViewCell" }
    override class var REUSE_IDENTIFIER: String { return "FrontPageArticleTableViewCell" }
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var upvoteCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func updateContents(titleText: String, previewImageUrl: String, linkText: String, upvoteCount: Int, commentCount: Int, dateText: String) {
        titleLabel.text = titleText
        previewImageView.setImage(from: previewImageUrl)
        upvoteCountLabel.text = String(upvoteCount)
        commentsCountLabel.text = String(commentCount)
        dateLabel.text = dateText
    }
    
}
