//
//  LowerCaseRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation
/**
 `LowerCaseRule` is a subclass of Rule that defines how a LowerCase is validated.
 */
open class LowerCaseRule: RegexRule {
    /// number regular express string to be used in validation.
    static let regex = "^.*?[a-z].*?$"
    
    /**
     Initializes a `LowerCaseRule` object. Used to validate that a field has a valid lower case rule.
     
     - parameter message: Error message that is displayed if validation fails.
     - returns: An initialized `LowerCaseRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public convenience init(message : String = ErrorManager.lowerCaseError.errorDescription!) {
        self.init(regex: LowerCaseRule.regex, message : message)
    }
    
}
