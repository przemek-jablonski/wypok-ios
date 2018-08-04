//
//  FrontPageArticleCell.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 04/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit

class FrontPageArticleCell: UITableViewCell {
    
    @IBOutlet private weak var articleTitleLabel: UILabel!
    @IBOutlet private weak var articleLinkLabel: UILabel!
    
    func updateContents(articleTitleText: String, articleLinkText: String) {
        articleTitleLabel.text = articleTitleText
        articleLinkLabel.text = articleLinkText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
