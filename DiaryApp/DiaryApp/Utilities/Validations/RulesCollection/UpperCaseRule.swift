//
//  UpperCaseRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation
/**
 `UpperCaseRule` is a subclass of Rule that defines how a number is validated.
 */
open class UpperCaseRule: RegexRule {
    /// number regular express string to be used in validation.
    static let regex = "^.*?[A-Z].*?$"
    
    /**
     Initializes a `UpperCaseRule` object. Used to validate that a field has a valid Upper case.
     
     - parameter message: Error message that is displayed if validation fails.
     - returns: An initialized `UpperCaseRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public convenience init(message : String = ErrorManager.upperCaseError.errorDescription!) {
        self.init(regex: UpperCaseRule.regex, message : message)
    }
    
}
