//
//  AlphaRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation

/**
 `AlphaRule` is a subclass of `CharacterSetRule`. It is used to verify that a field has a
 valid list of alpha characters.
 */
open class AlphaRule: CharacterSetRule {
    
    /**
     Initializes an `AlphaRule` object to verify that a field has valid set of alpha characters.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason.
     */
    public init(message: String = ErrorManager.alphabeticError.errorDescription!) {
        super.init(characterSet: CharacterSet.letters, message: message)
    }
}
