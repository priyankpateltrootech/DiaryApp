//
//  ExactLengthRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation

/**
 `ExactLengthRule` is a subclass of Rule that is used to make sure a the text of a field is an exact length.
 */
open class ExactLengthRule : Rule {
    /// parameter message: String of error message.
    fileprivate var message : String = ErrorManager.exactLengthError.errorDescription!
    /// parameter length: Integer value string length
    fileprivate var length : Int
    
    /**
     Initializes an `ExactLengthRule` object to validate the text of a field against an exact length.
     
     - parameter length: Integer value of exact string length being specified.
     - parameter message: String of error message.
     - returns: An initialized `ExactLengthRule` object, or nil if an object could not be created for some reason. that would not result in an exception.
     */
    public init(length: Int, message : String = ErrorManager.exactLengthError.errorDescription!){
        self.length = length
        self.message = String(format: message, self.length)
    }
    
    /**
     Used to validate a field.
     
     - parameter value: String to checked for validation.
     - returns: A boolean value. True if validation is successful; False if validation fails.
     */
    open func validate(_ value: String) -> Bool {
        return value.count == length
    }
    
    /**
     Displays error message if a field fails validation.
     
     - returns: String of error message.
     */
    open func errorMessage() -> String {
        return message
    }
}
