//
//  RMEpisodeResponse.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import ObjectMapper

class RMEpisodeResponse: Mappable {

    var info: RMEpisodeResponseInfo?
    var results: [RMEpisode]?
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        info   <- map["info"]
        results   <- map["results"]
    }
    
}
