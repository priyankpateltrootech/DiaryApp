//
//  String.swift
//  Pharma247
//
//  Created by Sagar Chauhan on 09/08/19.
//  Copyright © 2019 TRooTech. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    //--------------------------------------------------
    // MARK:- Properties
    //--------------------------------------------------
    
    // Variable used to get localized key
    var localized: String {
        return NSLocalizedString(self, comment: "Dynamic String Localization")
    }
    
    var htmlAttributedString: NSAttributedString? {
        return try? NSAttributedString(
            data: Data(utf8),
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil)
    }
    
    //    var localized: String {
    //        if let _ = UserDefaults.standard.string(forKey: "i18n_language") {} else {
    //            // we set a default, just in case
    //            UserDefaults.standard.set("fr", forKey: "i18n_language")
    //            UserDefaults.standard.synchronize()
    //        }
    //
    //        let lang = UserDefaults.standard.string(forKey: "i18n_language")
    //
    //        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
    //        let bundle = Bundle(path: path!)
    //
    //        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    //    }
    
    // Trimiming white space and newlines
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isBackspace: Bool {
        let char = self.cString(using: String.Encoding.utf8)!
        return strcmp(char, "\\b") == -92
    }
    
    var toDouble: Double {
        return (self as NSString).doubleValue
    }
    
    var toInt: Int {
        return (self as NSString).integerValue
    }
    
    func valueWithDollar() -> String {
        if let doubleValue = Double(self) {
            return String(format: "$%.2f", doubleValue)
        } else {
            return String(format: "$%.2f", 0.00)
        }
    }
    
    func htmlString() -> NSAttributedString? {
        if let data = self.data(using: .unicode) {
            if let attributeString = try? NSAttributedString(
                data: data,
                options: [
                    .documentType: NSAttributedString.DocumentType.html
                ], documentAttributes: nil) {
                return attributeString
            }
        }
        return nil
    }
    
    
    
    //--------------------------------------------------
    // MARK:- Functions
    //--------------------------------------------------

    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    
    
}



extension Array {
    
    public func toDictionary<Key: Hashable>(with selectKey: (Element) -> Key) -> [Key:Element] {
        var dict = [Key:Element]()
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
}



extension Double {
    
    func valueWithDollar() -> String {
        return String(format: "$%.2f", self)
    }
    
    /// Rounds the double to decimal places value
    func roundTo(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
