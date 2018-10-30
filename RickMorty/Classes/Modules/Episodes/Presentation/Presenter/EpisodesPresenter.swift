//
//  EpisodesPresenter.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

protocol EpisodesPresenterDelegate: NSObjectProtocol {
}

class EpisodesPresenter: NSObject {
    
    private weak var delegate: EpisodesPresenterDelegate?
    
    init(delegate: EpisodesPresenterDelegate) {
        self.delegate = delegate
    }
}
