//
//  FrontPageArticleCell.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 04/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit

class FrontPageArticleCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var linkLabel: UILabel!
    @IBOutlet weak var upvoteCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func updateContents(titleText: String, linkText: String, upvoteCount: Int, commentCount: Int, dateText: String) {
        titleLabel.text = titleText
//        previewImageView.image = UIImage
        linkLabel.text = linkText
        upvoteCountLabel.text = String(upvoteCount)
        commentCountLabel.text = String(commentCount)
        dateLabel.text = dateText
    }
    
}
