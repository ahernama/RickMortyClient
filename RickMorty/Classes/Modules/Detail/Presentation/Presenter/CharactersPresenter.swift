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
}

class CharactersPresenter: NSObject {
    
    private weak var delegate: CharactersPresenterDelegate?
    
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
    
    //Request information methods
    func requestCharacters(){
        
    }
}
