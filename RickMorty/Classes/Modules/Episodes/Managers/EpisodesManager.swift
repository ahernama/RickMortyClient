//
//  EpisodesManager.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class EpisodesManager: NSObject {
}

//
// MARK: - List episodes methods
//

extension EpisodesManager {
    
    func getEpisodesList(currentPage:Int, completion:@escaping ([RMEpisode]?,RickMortyError?)->Void){
        /* First we ask the database if the page-related episodes are there */
        EpisodesDataBaseProvider.sharedInstance.getEpisodesbyPage(currentPage: currentPage) { (episodes) in
            guard let currentEpisodes = episodes, currentEpisodes.isEmpty == false else {
                /* If they are not there, we request them from the API */
                EpisodesApiDataProvider.sharedInstance.getEpisodesByPage(currentPage: currentPage, completion: { (episodes, error) in
                    if let episodesFromApi = episodes, episodesFromApi.count > 0 {
                        EpisodesDataBaseProvider.sharedInstance.insertEpisodes(episodes: episodesFromApi, page: currentPage)
                    }
                    completion(episodes,error)
                })
                return
            }
            completion(episodes,nil)
        }
    }
}
