//
//  MainstructurePresenter.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

protocol MainstructurePresenterDelegate: NSObjectProtocol {
    func configureBottomTabBar()
    func configureBottomLineIndicator()
}

class MainstructurePresenter: NSObject {
    
    private weak var delegate: MainstructurePresenterDelegate?
    
    init(delegate: MainstructurePresenterDelegate) {
        self.delegate = delegate
    }
    
    //Life cycle methods
    
    func viewDidLoad(){
        self.delegate?.configureBottomTabBar()
        self.delegate?.configureBottomLineIndicator()
    }
}
