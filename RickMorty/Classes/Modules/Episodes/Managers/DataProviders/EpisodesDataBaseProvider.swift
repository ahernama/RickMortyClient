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
    
    static let sharedInstance = EpisodesDataBaseProvider()
    
    override init() {
        super.init()
    }
    
    //
    // Requesting episodes per page in DB in the same way as in remote,
    // This allows that if new episodes are published we
    // can request the first ones in bd and the new ones to the api
    
    func getEpisodesbyPage(currentPage:Int,completion:@escaping ([RMEpisode]?)->Void){
        var episodes:[RMEpisode] = []
        let realm = try! Realm()
        let results = realm.objects(RMEpisode.self).filter("pageEpisode == \(currentPage)")
        for currentResult in results {
            episodes.append(currentResult)
        }
        completion(episodes)
    }
    
     // Once we recover from the API the episodes, they are stored in Database
    func insertEpisodes(episodes:[RMEpisode]?, page:Int){
        if let currentEpisodes = episodes {
            let episodesWithPage = currentEpisodes.map { (episode) -> RMEpisode in
                episode.pageEpisode = page
                return episode
            }
            let realm = try! Realm()
            try! realm.write {
                realm.add(episodesWithPage, update: true)
            }
        }
    }
}
