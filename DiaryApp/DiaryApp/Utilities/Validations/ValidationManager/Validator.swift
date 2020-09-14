//
//  Validator.swift
//  ValidationManager
//
//  Created by Sagar Chauhan on 26/04/17.
//  Copyright © 2017 Master All rights reserved.
//

import Foundation
import UIKit

/**
 
 The `ValidationRuleSet` struct contains multiple validation rules with the same
 associated type (`InputType`).
 
 */
open class Validator {
    
    /**
     
     Initializes an empty validation rule set.
     
     */
    public init() {
        
    }
    
    /**
     
     An array of type erased validation rules.
     
     */
    internal var rules = [ValidationRule]()
    internal var errors = [ValidationError]()
    
    
    // MARK: Private functions
    
    /**
     This method is used to validate all fields registered to Validator. If validation is unsuccessful,
     field gets added to errors dictionary.
     
     - returns: No return value.
     */
    fileprivate func validateAllFields() {
        
        for rule in rules {
            if let error = rule.validateField() {
                errors.append(error)
                break
            } else {
                // No error
            }
        }
    }
    
    /**
     
     Appends a validation rule to the set.
     
     - Parameters:
     - rule: Validation rule to be appended.
     
     */
    open func registerField(_ field: ValidatableField, errorLabel:UILabel? = nil, rule:[Rule]) {
        rules.append(ValidationRule(field: field, rules:rule, errorLabel:errorLabel))

    }
    
    
    /**
     This method checks to see if all fields in validator are valid.
     
     - returns: No return value.
     */
    open func validate(_ success: @escaping () -> Void, failure: @escaping ([ValidationError]) -> Void) {
        
        self.validateAllFields()
        
        if errors.isEmpty {
            success()
        } else {
            failure(errors)
        }
        
    }
    
//    /**
//     This method validates all fields in validator and sets any errors to errors parameter of callback.
//     
//     - parameter callback: A closure which is called with errors, a dictionary of type Validatable:ValidationError.
//     - returns: No return value.
//     */
//    public func validate(_ callback:(_ errors:[(Validatable, ValidationError)])->Void) -> Void {
//        
//        self.validateAllFields()
//        
//        callback(errors.map { (fields[$1.field]!, $1) } )
//    }

}

/**
 The `Rule` protocol declares the required methods for all objects that subscribe to it.
 */
public protocol Rule {
    /**
     Validates text of a field.
     
     - parameter value: String of text to be validated.
     - returns: Boolean value. True if validation is successful; False if validation fails.
     */
    func validate(_ value: String) -> Bool
    /**
     Displays error message of a field that has failed validation.
     
     - returns: String of error message.
     */
    func errorMessage() -> String
}
