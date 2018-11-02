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
    func configureHeaderView()
    func configureHeaderWithEpisode(episode:RMEpisode)
    func configureHeaderWithFilters(filters:[String])
    
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
        self.delegate?.configureHeaderView()
        self.delegate?.configureTableView()
        
        self.delegate?.showLoadingIndicator()
        self.requestCharacters()
    }
    
    func viewWillAppear(){
        self.delegate?.sizeHeaderView()
        self.delegate?.configureHeaderWithEpisode(episode: self.episode)
    }
    
    //tableview datasource methods
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
        charactersManager.getCharactersList(currentIds: getCharactersIdByEpisode(episode: self.episode)) { (characters, error) in
            self.delegate?.hideLoadingIndicator()
            
            guard let currentCharacters = characters, currentCharacters.isEmpty == false, error == nil else{
                //Show Error and retry
                return
            }
            self.characters = currentCharacters
            self.delegate?.configureHeaderWithFilters(filters: self.getStatusByCharacters(characters: self.characters))
            
            self.filterCharacters = self.characters
            self.delegate?.loadCharacters()
        }
    }
    
    func getCharactersIdByEpisode(episode:RMEpisode)->[Int]{
        var currentIds:[Int] = []
        for character in episode.characters {
            if let idCharacter = Int(character.replacingOccurrences(of: RickMortyDefines.ContentServices.baseUrl+RickMortyDefines.ContentServices.Characters.getCharacters, with: "")) {
                currentIds.append(idCharacter)
            }
        }
        return currentIds
    }
    
    //Filter methods
    func filterByStatus(currentStatus:String){
        if currentStatus == String.filter_all {
            self.filterCharacters = self.characters
        }else{
            self.filterCharacters = self.characters.filter { $0.status == currentStatus }
        }
        self.delegate?.loadCharacters()
    }
    
    func getStatusByCharacters(characters:[RMCharacter]) -> [String] {
        var status:[String] = []
        status.append(String.filter_all)
        if characters.count > 1 {
            for currentCharacter in characters {
                if status.contains(currentCharacter.status) == false {
                    status.append(currentCharacter.status)
                }
            }
        }
        return status
    }
    
    //Route methods
    func backAction(){
        self.transitionToBack()
    }
}

//
// MARK: - Transition Methods
//

extension CharactersPresenter{
    func transitionToBack(){
        RouterManager.shared.visibleViewController?.dismiss(animated: true, completion: nil)
    }
}
