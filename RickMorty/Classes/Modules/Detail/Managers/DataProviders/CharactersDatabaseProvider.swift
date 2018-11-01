//
//  CharactersDatabaseProvider.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import RealmSwift

class CharactersDatabaseProvider: NSObject {
    
    static let sharedInstance = CharactersDatabaseProvider()
    
    override init() {
        super.init()
    }
    
    func getCharactersbyIds(currentIds:[Int],completion:@escaping ([RMCharacter]?)->Void){
        var characters:[RMCharacter] = []
        let realm = try! Realm()
        
        let results = realm.objects(RMCharacter.self).filter("idCharacter IN %@", currentIds)
        for currentResult in results {
            characters.append(currentResult)
        }
        completion(characters)
    }
    
    func insertCharacters(characters:[RMCharacter]?){
        if let currentCharacters = characters {
            let realm = try! Realm()
            try! realm.write {
                realm.add(currentCharacters, update: true)
            }
        }
    }

}
