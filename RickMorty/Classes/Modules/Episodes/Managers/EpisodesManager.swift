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
        EpisodesDataBaseProvider.sharedInstance.getEpisodesByPage(currentPage: currentPage) { (episodes, error) in
            guard let currentEpisodes = episodes, currentEpisodes.isEmpty == false, error == nil else {
                EpisodesApiDataProvider.sharedInstance.getEpisodesByPage(currentPage: currentPage, completion: { (episodes, error) in
                    completion(episodes,error)
                })
                return
            }
            completion(episodes,nil)
        }
    }
}
