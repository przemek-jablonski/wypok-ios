//
//  MirkoEntryTableViewCell.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit

@IBDesignable
class MirkoEntryTableViewCell: WypokTableViewCell {
    
    override class var XIB_FILENAME: String { return "MirkoEntryTableViewCell" }
    override class var REUSE_IDENTIFIER: String { return "MirkoEntryTableViewCell" }

    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorInformationStack: UIStackView!
    @IBOutlet weak var authorDeviceLabel: UILabel?
    @IBOutlet weak var entryContentLabel: UILabel!
    @IBOutlet weak var entryEmbedImageView: UIImageView!
    @IBOutlet weak var entryUpvotesLabel: UILabel!
    @IBOutlet weak var entryCommentsLabel: UILabel!
    @IBOutlet weak var DEBUGLABELOLOL: UILabel!
    
    func updateContents(DEBUGTEXTOLOL: String, authorImageUrl: String, authorName: String, authorDevice: String?, entryContent: NSAttributedString, entryEmbedImageUrl: String?, entryUpvotesCount: Int, entryCommentsCount: Int) {
        DEBUGLABELOLOL.text = DEBUGTEXTOLOL
        authorImageView.setImage(from: authorImageUrl)
        authorNameLabel.text = authorName
        entryContentLabel.attributedText = entryContent
        entryUpvotesLabel.text = String(entryUpvotesCount)
        entryCommentsLabel.text = String(entryCommentsCount)
        handle(authorDeviceLabel!, apply: authorDevice)
        handle(entryEmbedImageView!, apply: entryEmbedImageUrl)
    }
    
    private func handle(_ deviceTextLabel: UILabel, apply deviceText: String?) {
        if (deviceText.isNotBlank) {
            deviceTextLabel.isHidden = false
            deviceTextLabel.text = deviceText
        } else {
            deviceTextLabel.isHidden = true
        }
    }
    
    private func handle(_ embedImageView: UIImageView, apply embedImageUrl: String?) {
        if (embedImageUrl.isNotBlank) {
            embedImageView.isHidden = false
            embedImageView.setImage(from: embedImageUrl!)
        } else {
            embedImageView.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
