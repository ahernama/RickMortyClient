//
//  CharactersManager.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class CharactersManager: NSObject {
    
    func getCharactersList(currentIds:[Int], completion:@escaping ([RMCharacter]?,RickMortyError?)->Void){
        /* First we ask the database if the characters from the episode selected are there */
        CharactersDatabaseProvider.sharedInstance.getCharactersbyIds(currentIds: currentIds) { (characters) in
            guard let currentCharacters = characters, currentCharacters.count == currentIds.count else {
                /* If they are not there, we request them from the API */
                CharactersApiDataProvider.sharedInstance.getCharactersById(currentIds: currentIds, completion: { (characters, error) in
                    if let charactersFromApi = characters, charactersFromApi.count > 0{
                        CharactersDatabaseProvider.sharedInstance.insertCharacters(characters: charactersFromApi)
                    }
                    completion(characters,error)
                })
                return
            }
            completion(characters,nil)
        }
    }
}
