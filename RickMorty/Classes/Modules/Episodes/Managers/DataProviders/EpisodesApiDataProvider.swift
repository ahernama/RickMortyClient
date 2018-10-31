//
//  EpisodesApiDataProvider.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class EpisodesApiDataProvider: NSObject {
    
    static let sharedInstance = EpisodesApiDataProvider()
    
    override init() {
        super.init()
    }
    
    func getEpisodesByPage(currentPage:Int?, completion:@escaping ([RMEpisode]?,RickMortyError?)->Void){

        let serviceUrl = RickMortyDefines.ContentServices.baseUrl+RickMortyDefines.ContentServices.Episodes.getEpisodes
        let sessionManager = Alamofire.SessionManager.default
        let parameters:Parameters = ["page":currentPage ?? RickMortyDefines.ContentServices.Episodes.defaultPage]
        sessionManager.request(serviceUrl, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString), headers: nil).responseString { (response) -> Void in
            
            guard response.response != nil, response.result.isSuccess, let value = response.result.value else {
                let currentStatus = Reach().connectionStatus()
                switch currentStatus {
                case .unknown, .offline:
                    completion(nil,RickMortyError.noConnection)
                    return
                case .online(.wwan), .online(.wiFi):
                    completion(nil,RickMortyError.unknown)
                    return
                }
            }
            let rMEpisodeResponse = Mapper<RMEpisodeResponse>().map(JSONString: value)
            guard rMEpisodeResponse != nil, rMEpisodeResponse?.results != nil else{
                completion(nil,RickMortyError.noPageAllowed)
                return
            }
            completion(rMEpisodeResponse?.results,nil)
        }
    }
}
