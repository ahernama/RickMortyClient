//
//  CharactersApiDataProvider.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class CharactersApiDataProvider: NSObject {
    
    static let sharedInstance = CharactersApiDataProvider()
    
    override init() {
        super.init()
    }
    
    func getCharactersById(currentIds:[Int], completion:@escaping ([RMCharacter]?,RickMortyError?)->Void){
        let parametersIds:String = currentIds.compactMap({"\($0)"}).joined()
        let serviceUrl = RickMortyDefines.ContentServices.baseUrl+RickMortyDefines.ContentServices.Characters.getCharacters+parametersIds
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.request(serviceUrl, method: .get, parameters: nil, encoding: URLEncoding(destination: .queryString), headers: nil).responseString { (response) -> Void in
            
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
            let rMCharacters = Mapper<RMCharacter>().mapArray(JSONString: value)
            guard let currentCharacters = rMCharacters, currentCharacters.count > 0 else{
                completion(nil,RickMortyError.noPageAllowed)
                return
            }
            completion(currentCharacters,nil)
        }
    }

}
