//
//  RMCharacter.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 1/11/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class RMCharacter: Object, Mappable {
    
    @objc dynamic var idCharacter: Int = 0
    @objc dynamic var nameCharacter: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var species: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var created: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "idCharacter"
    }
    
    // Mappable
    func mapping(map: Map) {
        idCharacter   <- map["id"]
        nameCharacter   <- map["name"]
        
        status   <- map["status"]
        species   <- map["species"]
        type   <- map["type"]
        gender   <- map["gender"]
        image   <- map["image"]
        
        url   <- map["url"]
        created   <- map["created"]
    }
}
