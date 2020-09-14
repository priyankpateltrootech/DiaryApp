//
//  ZipCodeRule.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation

/**
 `ZipCodeRule` is a subclass of `RegexRule` that represents how zip codes are to be validated.
 */
open class ZipCodeRule: RegexRule {
    /**
     Initializes a `ZipCodeRule` object.
     
     - parameter message: String that holds error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public convenience init(message : String = ErrorManager.zipCodeError.errorDescription!){
        self.init(regex: "\\d{5}", message : message)
    }
}
