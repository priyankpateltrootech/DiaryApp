//
//  EmailRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation

/**
 `EmailRule` is a subclass of RegexRule that defines how a email is validated.
 */
open class EmailRule: RegexRule {
    
    /// Regular express string to be used in validation.
//    static let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,6}"
    
    /**
     Initializes an `EmailRule` object to validate an email field.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public convenience init(message : String = ErrorManager.emailError.errorDescription!){
        self.init(regex: EmailRule.regex, message: message)
    }
}
