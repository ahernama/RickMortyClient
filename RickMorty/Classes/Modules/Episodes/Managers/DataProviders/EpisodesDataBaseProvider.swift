//
//  EpisodesDataBaseProvider.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import RealmSwift

class EpisodesDataBaseProvider: NSObject {
    
    static let sharedInstance = EpisodesApiDataProvider()
    
    override init() {
        super.init()
    }
    
    func getEpisodesbyPage(currentPage:Int,completion:@escaping ([RMEpisode]?)->Void){
        var episodes:[RMEpisode] = []
        let realm = try! Realm()
        let results = realm.objects(RMEpisode.self).filter("idEpisode == '\(currentPage)'")
        for currentResult in results {
            episodes.append(currentResult)
        }
        completion(episodes)
    }
    
    func insertEpisodes(episodes:[RMEpisode]?){
        if let currentEpisodes = episodes {
            let realm = try! Realm()
            try! realm.write {
                realm.add(currentEpisodes, update: true)
            }
        }
    }
}
