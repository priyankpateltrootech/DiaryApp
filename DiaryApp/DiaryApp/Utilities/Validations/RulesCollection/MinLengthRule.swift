//
//  MinLengthRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation

/**
 `MinLengthRule` is a subclass of Rule that defines how minimum character length is validated.
 */
open class MinLengthRule: Rule {
    /// Default minimum character length.
    fileprivate var DEFAULT_LENGTH: Int = 3
    /// Default error message to be displayed if validation fails.
    fileprivate var message : String = ErrorManager.minLengthError.errorDescription!
    
    /// - returns: An initialized `MinLengthRule` object, or nil if an object could not be created for some reason that would not result in an exception.
    public init(){}
    
    /**
     Initializes a `MaxLengthRule` object that is to validate the length of the text of a field.
     
     - parameter length: Minimum character length.
     - parameter message: String of error message.
     - returns: An initialized `MinLengthRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(length: Int, message : String = ErrorManager.minLengthError.errorDescription!){
        self.DEFAULT_LENGTH = length
        self.message = String(format: message, self.DEFAULT_LENGTH)
    }
    
    /**
     Validates a field.
     - parameter value: String to checked for validation.
     - returns: A boolean value. True if validation is successful; False if validation fails.
     */
    open func validate(_ value: String) -> Bool {
        return value.count >= DEFAULT_LENGTH
    }
    
    /**
     Displays error message when field has failed validation.
     
     - returns: String of error message.
     */
    open func errorMessage() -> String {
        return message
    }
}
