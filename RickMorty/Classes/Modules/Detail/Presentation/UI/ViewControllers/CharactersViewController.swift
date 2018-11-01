//
//  CharactersViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class CharactersViewController: RickMortyViewController {
    
    fileprivate lazy var episodesPresenter: CharactersPresenter = CharactersPresenter(delegate: self)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CharactersViewController : CharactersPresenterDelegate {
    func configureTableView() {
    }
    
    func sizeHeaderView() {
    }
    
    func showLoadingIndicator() {
        self.showLoadingView()
    }
    
    func hideLoadingIndicator() {
        self.hideLoadingView { (completion) in
        }
    }
    
    func loadEpisodes(_ indexPaths: [IndexPath], needClear: Bool) {
    }
    
    func loadCollectionLoading() {
    }
}
