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
    @IBOutlet weak var authorDevice: UILabel!
    @IBOutlet weak var entryContentLabel: UILabel!
    @IBOutlet weak var entryEmbedImageView: UIImageView!
    @IBOutlet weak var entryUpvotesLabel: UILabel!
    @IBOutlet weak var entryCommentsLabel: UILabel!
    
}
