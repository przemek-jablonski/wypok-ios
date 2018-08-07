//
//  FrontPageArticleTableViewCell.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 05/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit
import SDWebImage

class FrontPageArticleTableViewCell: UITableViewCell {

    static let XIB_FILENAME = "FrontPageArticleTableViewCell"
    static let REUSE_IDENTIFIER = "FrontPageArticleTableViewCell"
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var upvoteCountLabel: UILabel!
    @IBOutlet weak var commentsCountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func updateContents(titleText: String, previewImageUrl: String, linkText: String, upvoteCount: Int, commentCount: Int, dateText: String) {
        titleLabel.text = titleText
//        previewImageView.sd_setImage(with: URL(string: previewImageUrl)) { (image, error, cacheType, url) in
////            self.updateConstraints()
//        }
        upvoteCountLabel.text = String(upvoteCount)
        commentsCountLabel.text = String(commentCount)
        dateLabel.text = dateText
    }
    
}
