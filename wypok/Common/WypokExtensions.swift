//
//  WypokExtensions.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 06/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import UIKit

extension UIContextualAction {
    convenience init(style: UIContextualAction.Style, title: String, color: UIColor, actionHandler: @escaping UIContextualActionHandler) {
        self.init(style: style, title: title, handler: actionHandler)
        self.backgroundColor = color
    }
}

extension UISwipeActionsConfiguration {
    convenience init(action: UIContextualAction) {
        self.init(actions: [action])
    }
}

extension Dictionary where Key == String, Value == AnyObject {
    func prettyPrint() -> String{
        var string: String = ""
        if let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted){
            if let nstr = NSString(data: data, encoding: String.Encoding.utf8.rawValue){
                string = nstr as String
            }
        }
        return string
    }
}

extension String {
    func removeHtmlEntities() -> String {
        var string = self
        let entitiesDictionary = ["&quot;" : "\""]
        entitiesDictionary.forEach { (entity, entityReplacement) in
            string = self.removeHtmlEntity(entity: entity, replacement: entityReplacement)
        }
        return string
    }
    
    private func removeHtmlEntity(entity: String, replacement: String) -> String {
        if (self.contains(entity)) {
            return self.replacingOccurrences(of: entity, with: replacement)
        } else {
            return self
        }
    }
}
