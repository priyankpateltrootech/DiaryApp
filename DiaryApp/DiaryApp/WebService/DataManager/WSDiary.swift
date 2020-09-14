//
//  WSUser.swift
//  Pharma247Store
//
//  Created by Sagar Chauhan on 07/10/19.
//  Copyright © 2019 TRooTech. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

extension DataManager {
    
    func getDiaryList(_ completion: @escaping(Result<[DiaryListModel], APIError>) -> Void) {
        
        NetworkManager.shared.getResponse(getURL(.notes), mappingType: [DiaryListModel].self) { (mappableData, apiError) in
            
            guard let noteData = mappableData as? [DiaryListModel] else {
                completion(.failure(apiError ?? .errorMessage("Something went wrong")))
                return
            }
            
            completion(.success(noteData))
        }
    }
}
