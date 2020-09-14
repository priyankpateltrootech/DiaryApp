//
//  UIToolbarExtention.swift
//  Pharma247
//
//  Created by Samir on 19/09/19.
//  Copyright © 2019 TRooTech. All rights reserved.
//

import UIKit


extension UIToolbar{
    
    //ToolBar
    static func getDefault(barTintColor: UIColor) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.isTranslucent = false
        toolbar.barStyle = UIBarStyle.blackTranslucent
        toolbar.tintColor = UIColor.white
        toolbar.barTintColor = barTintColor
        return toolbar
    }
}

