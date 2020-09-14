//
//  ErrorManager.h
//  Master
//
//  Created by Sagar Chauhan on 10/17/2017.
//  Copyright © 2017 . All rights reserved.
//

import Foundation

// Error Manager
public enum ErrorManager : Error {
    
    case noInternetConnectionError
    
    case requiredFieldError
    
    case compareTextFieldError
    
    case characterSetError
    
    case alphabeticError
    
    case alphaNumbericError
    
    case phoneNumberError
    
    case regexError
    
    case exactLengthError
    
    case maxLengthError
    
    case minLengthError
    
    case zipCodeError
    
    case passwordError
    
    case emailError
    
    case numberError
    
    case upperCaseError
    
    case lowerCaseError
    
    case fullNameError
    
    case urlError
}

extension ErrorManager {
    
    var localizedDescription: String {
        
        switch self {
            
        case .noInternetConnectionError:
            return "No Internet Connection found"
            
        case .requiredFieldError:
            return "All Field are required"
            
        case .compareTextFieldError:
            return "Password and Confirm Password must be same"
            
        case .characterSetError:
            return "Text Mismatch"
            
        case .alphabeticError:
            return "Enter valid alphabetic characters"
            
        case .alphaNumbericError:
            return "Enter valid alpha numeric characters"
            
        case .phoneNumberError:
            return "Enter a valid 10 digit phone number"
            
        case .regexError:
            return "Invalid Regular Expression"
            
        case .exactLengthError:
            return "Must be at most 16 characters long"
            
        case .minLengthError:
            return "Must be at least 3 characters long"
            
        case .maxLengthError:
            return "Must be at most 16 characters long"
            
        case .zipCodeError:
            return "Enter a valid 5 digit zipcode"
            
        case .passwordError:
            return "Must be 8 characters with 1 uppercase"
            
        case .emailError:
            return "Must be a valid email address"
            
        case .numberError:
            return "Enter valid numeric characters"
            
        case .upperCaseError:
            return "All the Character must be in the Upper Case"
            
        case .lowerCaseError:
            return "All the Character must be in the Lower Case"
            
        case .fullNameError:
            return "Please provide a first & last name"
            
        case .urlError:
            return "Please enter valid website url"
        }
    }
}
extension ErrorManager: LocalizedError {
    
    public var errorDescription: String? {
        
        switch self {
            
        case .noInternetConnectionError:
            return "No Internet Connection found"
            
        case .requiredFieldError:
            return "All Field are required"
            
        case .compareTextFieldError:
            return ""
            
        case .characterSetError:
            return "Please enter characters only"
            
        case .alphabeticError:
            return "Enter valid alphabetic characters"
            
        case .alphaNumbericError:
            return "Enter valid alpha numeric characters"
            
        case .phoneNumberError:
            return "Enter a valid 10 digit phone number"
            
        case .regexError:
            return "Invalid Regular Expression"
            
        case .exactLengthError:
            return "Must be at most 16 characters long"
            
        case .maxLengthError:
            return "Must be at most 16 characters long"
            
        case .minLengthError:
            return "Must be at least 3 characters long"
            
        case .zipCodeError:
            return "Enter a valid 5 digit zipcode"
            
        case .passwordError:
            return "Must be 8 characters with 1 uppercase"
            
        case .emailError:
            return "Must be a valid email address"
            
        case .numberError:
            return "Enter valid numeric characters"
            
        case .upperCaseError:
            return "All the Character must be in the Upper Case"
            
        case .lowerCaseError:
            return "All the Character must be in the Lower Case"
            
        case .fullNameError:
            return "Please provide a first & last name"
            
        case .urlError:
            return "Please enter valid website url"
        }
    }
}
