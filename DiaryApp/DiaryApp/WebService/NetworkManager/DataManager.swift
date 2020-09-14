//
//  DataManager.swift
//  Pharma247Store
//
//  Created by Sagar Chauhan on 07/10/19.
//  Copyright © 2019 TRooTech. All rights reserved.
//

import Foundation
import Alamofire

class DataManager: NSObject {
    
    //------------------------------------------------------------------------------
    // MARK:-
    // MARK:- Variables
    //------------------------------------------------------------------------------
    
    static let shared   = DataManager()
//    let baseUrl         = WebServiceURL.lives
    let baseUrl         = WebServiceURL.local
    
    // Create http headers
    func getHttpHeaders() -> HTTPHeaders {
        var httpHeader = HTTPHeaders()
        httpHeader["Content-Type"] = "application/json"
        httpHeader["Accept"] = "application/json"
        return httpHeader
    }
    
    
    //------------------------------------------------------------------------------
    // MARK:-
    // MARK:- Custom Methods
    //------------------------------------------------------------------------------
    
    // Get API url with endpoints
    func getURL(_ endpoint: WSEndPoints) -> String {
        return baseUrl + endpoint.rawValue
    }
}


//------------------------------------------------------------------------------
// MARK:-
// MARK:- WebserviceURL
//------------------------------------------------------------------------------

struct WebServiceURL {
    static let local        = "https://private-ba0842-gary23.apiary-mock.com/"
    static let live         = "https://private-ba0842-gary23.apiary-mock.com/"
}


//------------------------------------------------------------------------------
// MARK:-
// MARK:- WebserviceEndPoints
//------------------------------------------------------------------------------

enum WSEndPoints: String {
    
    case notes             = "notes"
}


//------------------------------------------------------------------------------
// MARK:-
// MARK:- enum - Result
//------------------------------------------------------------------------------

enum Result<T, U> where U: Error  {
    case success(T)
    case failure(U)
}


//------------------------------------------------------------------------------
// MARK:-
// MARK:- enum - APIError
//------------------------------------------------------------------------------

enum APIError: Error {
    case errorMessage(String)
    case requestFailed(String)
    case jsonConversionFailure(String)
    case invalidData(String)
    case responseUnsuccessful(String)
    case jsonParsingFailure(String)
    
    var localizedDescription: String {
        
        switch self {
            
        case.errorMessage(let msg):
            return msg
            
        case .requestFailed(let msg):
            return msg
            
        case .jsonConversionFailure(let msg):
            return msg
            
        case .invalidData(let msg):
            return msg
            
        case .responseUnsuccessful(let msg):
            return msg
            
        case .jsonParsingFailure(let msg):
            return msg
        }
    }
}
