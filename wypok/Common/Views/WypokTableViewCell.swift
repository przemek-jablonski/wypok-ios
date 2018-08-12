//
//  WypokTableViewCell.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 12/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import UIKit

typealias CellReuseIdentifierType = String

class WypokTableViewCell: UITableViewCell {
    
    class var XIB_FILENAME: String { fatalError() }
    class var REUSE_IDENTIFIER: String { fatalError() }
    
    class var registerData: (UINib, CellReuseIdentifierType) {
        return (UINib(nibName: XIB_FILENAME, bundle: nil), REUSE_IDENTIFIER)
    }
    
}
