//
//  RMEpisode.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class RMEpisode: Object, Mappable {
    
    @objc dynamic var idEpisode: Int = 0
    @objc dynamic var nameEpisode: String = ""
    @objc dynamic var airDate: String = ""
    @objc dynamic var episode: String = ""
    
    @objc dynamic var charactersRemote: [String] = []
    let characters: List<String> = List<String>()
    
    @objc dynamic var url: String = ""
    @objc dynamic var created: String = ""
    
    @objc dynamic var pageEpisode: Int = RickMortyDefines.ContentServices.Episodes.defaultPage
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func ignoredProperties() -> [String] {
        return ["charactersRemote"]
    }
    
    override class func primaryKey() -> String? {
        return "idEpisode"
    }
    
    // Mappable
    func mapping(map: Map) {
        idEpisode   <- map["id"]
        nameEpisode   <- map["name"]
        airDate   <- map["airDate"]
        episode   <- map["episode"]
        
        charactersRemote  <- map["characters"]
        for currentChar in charactersRemote{
            self.characters.append(currentChar)
        }
        
        url   <- map["url"]
        created   <- map["created"]
    }
}
