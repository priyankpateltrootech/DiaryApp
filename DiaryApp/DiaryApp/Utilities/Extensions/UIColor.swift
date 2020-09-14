//
//  UIColor.swift
//  Pharma247
//
//  Created by Sagar Chauhan on 14/08/19.
//  Copyright © 2019 TRooTech. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    // Theme gray color
    class var themeGray: UIColor {
        return UIColor(hex: "737373")
    }
    
    // Theme gray color
    class var themeBlue: UIColor {
        return UIColor(hex: "737373")
    }
    
    // Theme gray color
    class var themeYellow: UIColor {
        return UIColor(hex: "D8A436")
    }
    
    
    convenience init(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: 1.0)
    }
    
    
    class var buttonBackgorungColor: UIColor {
        return UIColor(red: 232/255, green: 88/255, blue: 27/255, alpha: 1)
    }
    
    class var userImageBorderColor: UIColor {
        return UIColor(red: 136/255, green: 136/255, blue: 136/255, alpha: 1)
    }
    
    class var CircleOverlayFillColor: UIColor {
        return UIColor(red: 167/255, green: 223/255, blue: 241/255, alpha: 1)
    }
    
}
