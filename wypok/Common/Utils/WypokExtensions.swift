//
//  WypokExtensions.swift
//  wypok
//
//  Created by Przemyslaw Jablonski on 06/08/2018.
//  Copyright © 2018 Przemyslaw Jablonski. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

typealias CommonSuccessClosure = () -> ()
typealias CommonFailureClosure = (Error) -> ()

extension UIContextualAction {
    convenience init(style: UIContextualAction.Style, title: String, color: UIColor, actionHandler: @escaping UIContextualActionHandler) {
        self.init(style: style, title: title, handler: actionHandler)
        self.backgroundColor = color
    }
}

extension UISwipeActionsConfiguration {
    convenience init(_ action: UIContextualAction) {
        self.init(actions: [action])
    }
}

extension Dictionary where Key == String, Value == AnyObject {
    func prettyPrint() -> String {
        var string: String = ""
        if let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted){
            if let nstr = NSString(data: data, encoding: String.Encoding.utf8.rawValue){
                string = nstr as String
            }
        }
        return string
    }
}

extension Optional where Wrapped == String {
    var isBlank: Bool {
        return self == nil || self?.isEmpty ?? true || self?.elementsEqual("") ?? true
    }
    
    var isNotBlank: Bool {
        return !self.isBlank
    }
}

extension String {
    //todo: maybe there is a way to make extension for both Optional<String> and just String?
    var isBlank: Bool {
        return self.isEmpty || self.elementsEqual("")
    }
    
    var isNotBlank: Bool {
        return !self.isBlank
    }
    
    func removeHtmlEntities() -> String {
        let entitiesDictionary = ["&quot;" : "\""]
        var string = self
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
    
    func convertToAttributedString() -> NSMutableAttributedString {
         guard let attributed = try? NSMutableAttributedString(
            data: self.data(using: String.Encoding.unicode)!,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else {
                return NSMutableAttributedString(string: self)
        }
        return attributed
    }
}

extension NSAttributedString {
    func makeMutable() -> NSMutableAttributedString {
        return NSMutableAttributedString(attributedString: self)
    }
}

extension NSMutableAttributedString {
    func setFontFace(font: UIFont, color: UIColor? = nil) -> NSMutableAttributedString {
        beginEditing()
        self.enumerateAttribute(.font, in: NSRange(location: 0, length: self.length)) { (value, range, stop) in
            if let f = value as? UIFont, let newFontDescriptor = f.fontDescriptor.withFamily(font.familyName).withSymbolicTraits(f.fontDescriptor.symbolicTraits) {
                let newFont = UIFont(descriptor: newFontDescriptor, size: font.pointSize)
                removeAttribute(.font, range: range)
                addAttribute(.font, value: newFont, range: range)
                if let color = color {
                    removeAttribute(.foregroundColor, range: range)
                    addAttribute(.foregroundColor, value: color, range: range)
                }
            }
        }
        endEditing()
        return self
    }
}

extension UITableView {
    func register(with registerData: (UINib, CellReuseIdentifierType)) {
        register(registerData.0, forCellReuseIdentifier: registerData.1)
    }
}

extension UIImageView {
    func setImage(from url: String) {
        self.sd_setImage(with: URL(string: url)) { (image , error, _, url) in
            if (error != nil) {
                print("ERRORRRR!, \(error) for url: \(url) and image: \(image)")
            }
        }
    }
}

extension Array {
    func forEach(_ closure: (Element, Int) -> ()) {
        for (index, element) in self.enumerated() {
            closure(element, index)
        }
    }
}

extension ListIndexSetResult {
    func hasNoChanges() -> Bool {
        return self.hasChanges
    }
}

extension String {
    
    enum RandomType { case UUID }
    
    
}
