//
//  NumberRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation
/**
 `NumberRule` is a subclass of Rule that defines how a number is validated.
 */
open class NumberRule: RegexRule {
    /// number regular express string to be used in validation.
    static let regex = ".*\\d.*"
    
    /**
     Initializes a `NumberRule` object. Used to validate that a field has a valid phone number.
     
     - parameter message: Error message that is displayed if validation fails.
     - returns: An initialized `NumberRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public convenience init(message : String = ErrorManager.numberError.errorDescription!) {
        self.init(regex: NumberRule.regex, message : message)
    }
    
}
