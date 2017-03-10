//
//  MapperClassForAPI.swift
//  KLICKAT_replication3
//
//  Created by Sierra 4 on 08/03/17.
//  Copyright © 2017 code-brew. All rights reserved.
//

import Foundation
import ObjectMapper

class Categorydata: Mappable{
    var status: Int?
    var message: String?
    var data: Data?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        status <- map["status"]
        message <- map["message"]
        data <- map["data"]
    }
}

class Data: Mappable{
    var arabic: [Arabic]?
    var languageList: [Languagelist]?
    var english: [English]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        arabic <- map["arabic"]
        languageList <- map["languageList"]
        english <- map["english"]
    }
}

class English: Mappable{
    var name: String?
    var image: String?
    var new_order: Int?
    var order: Int?
    var supplier_placement_level: Int?
    var icon: String?
    var id: Int?
    var category_flow: String?
    var description: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        name <- map["name"]
        image <- map["image"]
        new_order <- map["new_order"]
        order <- map["order"]
        supplier_placement_level <- map["supplier_placement_level"]
        icon <- map["icon"]
        id <- map["id"]
        category_flow <- map["category_flow"]
        description <- map["description"]
    }
}

class Languagelist: Mappable{
    var language_name: String?
    var language_code: String?
    var id: Int?
    var rtl: Int?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        language_name <- map["language_name"]
        language_code <- map["language_code"]
        id <- map["id"]
        rtl <- map["rtl"]
    }
}

class Arabic: Mappable{
    var name: String?
    var image: String?
    var new_order: Int?
    var order: Int?
    var supplier_placement_level: Int?
    var icon: String?
    var id: Int?
    var category_flow: String?
    var description: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        name <- map["name"]
        image <- map["image"]
        new_order <- map["new_order"]
        order <- map["order"]
        supplier_placement_level <- map["supplier_placement_level"]
        icon <- map["icon"]
        id <- map["id"]
        category_flow <- map["category_flow"]
        description <- map["description"]
    }
}
