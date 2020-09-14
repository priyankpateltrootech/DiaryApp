//
//  ValidatableField.swift
//  ValidationManager
//
//  Created by Sagar Chauhan on 26/04/17.
//  Copyright © 2017 Master All rights reserved.
//

import Foundation
import UIKit

public typealias ValidatableField = AnyObject & Validatable

public protocol Validatable {
    
    var validationText: String {
        get
    }
}

extension UITextField: Validatable {
    
    public var validationText: String {
        return text ?? ""
    }
}

extension UITextView: Validatable {
    public var validationText: String {
        return text ?? ""
    }
}

extension UIImageView : Validatable {
    public var validationText: String {
        return (self.image != nil)  ?  "Found" : ""
    }
}
