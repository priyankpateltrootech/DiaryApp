//
//  ValidationRule.swift
//  ValidationManager
//
//  Created by Sagar Chauhan on 26/04/17.
//  Copyright © 2017 Master All rights reserved.
//

import Foundation
import UIKit

open class ValidationRule {
    
    /// the field of the field
    open var field:ValidatableField
    /// the errorLabel of the field
    open var errorLabel:UILabel?
    /// the rules of the field
    open var rules:[Rule] = []
    
    /**
     Initializes `ValidationRule` instance with field, rules, and errorLabel.
     
     - parameter field: field that holds actual text in field.
     - parameter errorLabel: label that holds error label of field.
     - parameter rules: array of Rule objects, which field will be validated against.
     - returns: An initialized `ValidationRule` object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(field: ValidatableField, rules:[Rule], errorLabel:UILabel?){
        self.field = field
        self.errorLabel = errorLabel
        self.rules = rules
    }
    
    /**
     Used to validate field against its validation rules.
     - returns: `ValidationError` object if at least one error is found. Nil is returned if there are no validation errors.
     */
    open func validateField() -> ValidationError? {
        return rules.filter{
            return !$0.validate(field.validationText)
            }.map{ rule -> ValidationError in return ValidationError(field: self.field, errorLabel:self.errorLabel, error: rule.errorMessage()) }.first
    }
}
