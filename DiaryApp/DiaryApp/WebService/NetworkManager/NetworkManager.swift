//
//  NetworkManager.swift

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

enum HUDFlag: Int {
    case show = 1
    case hide = 0
}


class NetworkManager: Session {
    
    static let shared = NetworkManager()
    
    //----------------------------------------------------------------
    // MARK: Get Request Method
    //----------------------------------------------------------------
    
    func getResponse<T: Mappable>(_ url: String, parameter: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, header: HTTPHeaders? = nil, showHUD: HUDFlag = .show, mappingType: [T].Type, completion: @escaping ([Mappable]?, APIError?) -> Void) {
        
        self.arrayRequest(url, method: .get, parameter: parameter, encoding: encoding, header: header, mappingType: mappingType) { (mappableResponse) in
            
            switch mappableResponse.result {
                
            case .success(let data):
                completion(data, nil)
                break
                
            case .failure(let error):
                completion(nil, .errorMessage(error.localizedDescription))
                break
            }
        }
    }
    
    
    // ----------------------------------------------------------------
    // MARK: Post Request Method
    // ----------------------------------------------------------------
    
    func postResponse<T: Mappable>(_ url: String, parameter: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, header: HTTPHeaders? = nil, showHUD: HUDFlag = .show, mappingType: [T].Type, completion: @escaping ([Mappable]?, APIError?) -> Void) {
        
        self.arrayRequest(url, method: .post, parameter: parameter, encoding: encoding, header: header, mappingType: mappingType) { (mappableResponse) in
            
            switch mappableResponse.result {
                
            case .success(let data):
                completion(data, nil)
                break
                
            case .failure(let error):
                completion(nil, .errorMessage(error.localizedDescription))
                break
            }
        }
    }
    
    
    // ----------------------------------------------------------------
    // MARK: Object Request Method
    // ----------------------------------------------------------------
    
    func objectRequest<T: BaseMappable>(_ url: String, method: Alamofire.HTTPMethod, parameter: Parameters? = nil, encoding: ParameterEncoding, header: HTTPHeaders? = nil, mappingType: T.Type, completionHandler: @escaping (DataResponse<T, AFError>) -> Void) -> Void {
        
        DispatchQueue.main.async {
            AppDelegate.shared.showProgres(true)
        }
        
        self.request(url, method: method, parameters: parameter, encoding: encoding, headers: header).responseObject { (response: DataResponse<T, AFError>) in
            
            DispatchQueue.main.async {
                AppDelegate.shared.showProgres(false)
            }
            
            completionHandler(response as DataResponse<T, AFError>)
        }
    }
    
    //--------------------------------------------------
    
    func arrayRequest<T: BaseMappable>(_ url: String, method: Alamofire.HTTPMethod, parameter: Parameters? = nil, encoding: ParameterEncoding, header: HTTPHeaders? = nil, mappingType: [T].Type, completionHandler: @escaping (DataResponse<[T], AFError>) -> Void) -> Void {
        
        DispatchQueue.main.async {
            AppDelegate.shared.showProgres(true)
        }
        
        self.request(url, method: method, parameters: parameter, encoding: encoding, headers: header).responseArray { (response: DataResponse<Array<T>, AFError>) in
            
            DispatchQueue.main.async {
                AppDelegate.shared.showProgres(false)
            }
            
            completionHandler(response as DataResponse<[T], AFError>)
        }
    }
}
