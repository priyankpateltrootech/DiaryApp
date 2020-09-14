//
//  RequiredRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation

/**
 `RequiredRule` is a subclass of Rule that defines how a required field is validated.
 */
open class RequiredRule: Rule {
    /// String that holds error message.
    fileprivate var message : String
    
    /**
     Initializes `RequiredRule` object with error message. Used to validate a field that requires text.
     
     - parameter message: String of error message.
     - returns: An initialized `RequiredRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(message : String = ErrorManager.requiredFieldError.errorDescription!){
        self.message = message
    }
    
    /**
     Validates a field.
     
     - parameter value: String to checked for validation.
     - returns: Boolean value. True if validation is successful; False if validation fails.
     */
    open func validate(_ value: String) -> Bool {
        return !value.isEmpty
    }
    
    /**
     Used to display error message when validation fails.
     
     - returns: String of error message.
     */
    open func errorMessage() -> String {
        return message
    }
}
