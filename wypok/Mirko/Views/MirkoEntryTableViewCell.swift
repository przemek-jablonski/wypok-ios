//
//  MirkoEntryTableViewCell.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import UIKit


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
    
    func updateContents(authorImageUrl: String, authorName: String, authorDevice: String, entryContent: NSAttributedString, entryEmbedImageUrl: String?, entryUpvotesCount: Int, entryCommentsCount: Int) {
        authorImageView.setImage(from: authorImageUrl)
        authorNameLabel.text = authorName
        if (authorDeviceLabel != nil) {
            processDeviceText(label: authorDeviceLabel!, deviceText: authorDevice)
        }
        entryContentLabel.attributedText = entryContent
        if (entryEmbedImageUrl != nil) {
            entryEmbedImageView.setImage(from: entryEmbedImageUrl!)
        }
        entryUpvotesLabel.text = String(entryUpvotesCount)
        entryCommentsLabel.text = String(entryCommentsCount)
    }
    
    private func processDeviceText(label: UILabel, deviceText: String) {
        if (!deviceText.isEmpty) {
            label.isHidden = false
            label.text = deviceText
        } else {
            label.isHidden = true
        }
    }
    
}
