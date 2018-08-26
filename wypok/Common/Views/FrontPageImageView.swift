//
//  FrontPageImageView.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 05/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import UIKit

//todo: why is this in common lol?
@IBDesignable
class FrontPageImageView: UIView {
    
    @IBOutlet private weak var articlePreviewImageView: UIImageView!
    @IBOutlet private weak var userInfoLabel: UILabel!
    @IBOutlet private weak var sourceLinkLabel: UILabel!
    
    func updateContents(articlePreview: UIImage, userInfo: String, sourceLink: String) {
        articlePreviewImageView.image = articlePreview
        userInfoLabel.text = userInfo
        sourceLinkLabel.text = sourceLink
    }
    
}
