//
//  NotesListModel.swift
//  DiaryApp
//
//  Created by Sagar on 11/09/20.
//  Copyright © 2020 Trootech. All rights reserved.
//

import Foundation
import ObjectMapper

struct DiaryListModel: Mappable {

    var content: String?
    var date: String?
    var id: String?
    var title: String?
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        content  <- map["content"]
        date  <- map["date"]
        id  <- map["id"]
        title  <- map["title"]
    }
}
