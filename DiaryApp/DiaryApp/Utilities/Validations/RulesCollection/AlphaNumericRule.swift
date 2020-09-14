//
//  AlphaNumericRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation

/**
 `AlphaNumericRule` is a subclass of `CharacterSetRule`. It is used to verify that a field has a
 valid list of alphanumeric characters.
 */
open class AlphaNumericRule: CharacterSetRule {
    
    /**
     Initializes a `AlphaNumericRule` object to verify that field has valid set of alphanumeric characters.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(message: String = ErrorManager.alphaNumbericError.errorDescription!) {
        super.init(characterSet: CharacterSet.alphanumerics, message: message)
    }
}
