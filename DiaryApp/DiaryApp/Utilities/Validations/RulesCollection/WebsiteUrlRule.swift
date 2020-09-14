//
//  WebsiteUrlRule.swift
//  IPH_Boostshop
//
//  Created by Sagar on 11/07/18.
//  Copyright © 2018 Sagar. All rights reserved.
//

import Foundation

/**
 `Website Url Rule` is a subclass of RegexRule that defines how a email is validated.
 */
open class WebsiteUrlRule: RegexRule {
    
    /// Regular express string to be used in validation.
    static let regex = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
    
    /**
     Initializes an `WebsiteUrlRule` object to validate an email field.
     
     - parameter message: String of error message.
     - returns: An initialized object, or nil if an object could not be created for some reason that would not result in an exception.
     */
    public convenience init(message : String = ErrorManager.urlError.errorDescription!){
        self.init(regex: WebsiteUrlRule.regex, message: message)
    }
}
