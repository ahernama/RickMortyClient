//
//  CharactersPresenter.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

protocol CharactersPresenterDelegate: NSObjectProtocol {
    func configureTableView()
    
    func sizeHeaderView()
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func loadCharacters()
}

class CharactersPresenter: NSObject {
    
    private weak var delegate: CharactersPresenterDelegate?
    var episode:RMEpisode!
    private lazy var charactersManager: CharactersManager = CharactersManager()

    
    private var characters:[RMCharacter] = []
    private var filterCharacters:[RMCharacter] = []
    
    init(delegate: CharactersPresenterDelegate) {
        self.delegate = delegate
    }
    
    //Life cycle methods
    func viewDidLoad(){
        self.delegate?.configureTableView()
        
        self.delegate?.showLoadingIndicator()
        self.requestCharacters()
    }
    
    func viewWillAppear(){
        self.delegate?.sizeHeaderView()
    }
    
    //collection view pagging methods
    func numCharacters(currentSection:Int) -> Int {
        return self.filterCharacters.count
    }
    
    func numSections() -> Int {
        return RickMortyDefines.CollectionViews.CharactersList.numSections
    }
    
    func currentCharacter(position:Int) -> RMCharacter? {
        if position < self.filterCharacters.count {
            return self.filterCharacters[position]
        }else{
            return nil
        }
    }
    
    //Request information methods
    func requestCharacters(){
        charactersManager.getCharactersList(currentIds: getrCharactersIdByEpisode(episode: self.episode)) { (characters, error) in
            self.delegate?.hideLoadingIndicator()
            
            guard let currentCharacters = characters, currentCharacters.isEmpty == false, error == nil else{
                //Show Error and retry
                return
            }
            self.characters = currentCharacters
            self.filterCharacters = self.characters
            self.delegate?.loadCharacters()
        }
    }
    
    func getrCharactersIdByEpisode(episode:RMEpisode)->[Int]{
        var currentIds:[Int] = []
        for character in episode.characters {
            if let idCharacter = Int(character.replacingOccurrences(of: RickMortyDefines.ContentServices.baseUrl+RickMortyDefines.ContentServices.Characters.getCharacters, with: "")) {
                currentIds.append(idCharacter)
            }
        }
        return currentIds
    }
}
