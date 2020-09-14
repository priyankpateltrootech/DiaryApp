//
//  ConfirmationRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation
/**
 `ConfirmationRule` is a subclass of Rule that defines how a field that has to be equal
 to another field is validated.
 */
open class ConfirmationRule: Rule {
    /// parameter confirmField: field to which original text field will be compared to.
    fileprivate let confirmField: String
    /// parameter message: String of error message.
    fileprivate var message : String
    
    fileprivate var isEmail : Bool = false
    /**
     Initializes a `ConfirmationRule` object to validate the text of a field that should equal the text of another field.
     
     - parameter confirmField: field to which original field will be compared to.
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(confirmField: String, isEmail: Bool, message : String = ErrorManager.compareTextFieldError.errorDescription!){
        self.confirmField = confirmField
        self.message = message
        self.isEmail = isEmail
    }
    
    /**
     Used to validate a field.
     
     - parameter value: String to checked for validation.
     - returns: A boolean value. True if validation is successful; False if validation fails.
     */
    open func validate(_ value: String) -> Bool {
        if self.isEmail {
            return confirmField.lowercased() == value.lowercased()
        }
        return confirmField == value
    }
    
    /**
     Displays an error message when text field fails validation.
     
     - returns: String of error message.
     */
    open func errorMessage() -> String {
        return message
    }
}
