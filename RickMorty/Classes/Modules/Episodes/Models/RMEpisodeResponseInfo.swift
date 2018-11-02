//
//  RMEpisodeResponseInfo.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import ObjectMapper

class RMEpisodeResponseInfo: Mappable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        count   <- map["count"]
        pages   <- map["pages"]
        next   <- map["next"]
        prev   <- map["prev"]
    }
}
