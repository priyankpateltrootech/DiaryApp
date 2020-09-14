//
//  CharacterSetRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation

/**
 `CharacterSetRule` is a subclass of `Rule`. It is used to validate IPV4 address fields.
 */
open class CharacterSetRule: Rule {
    /// NSCharacter that hold set of valid characters to hold
    fileprivate let characterSet: CharacterSet
    /// String that holds error message
    fileprivate var message: String
    
    /**
     Initializes a `CharacterSetRule` object to verify that field has valid set of characters.
     
     - parameter characterSet: NSCharacterSet that holds group of valid characters.
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public init(characterSet: CharacterSet, message: String = "Enter valid alpha") {
        self.characterSet = characterSet
        self.message = message
    }
    
    /**
     Used to validate field.
     
     - parameter value: String to checked for validation.
     - returns: Boolean value. True if validation is successful; False if validation fails.
     */
    open func validate(_ value: String) -> Bool {
        for uni in value.unicodeScalars {
            guard let uniVal = UnicodeScalar(uni.value), characterSet.contains(uniVal) else {
                return false
            }
        }
        return true
    }
    
    /**
     Displays error message when field fails validation.
     
     - returns: String of error message.
     */
    open func errorMessage() -> String {
        return message
    }
}
