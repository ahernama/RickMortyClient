//
//  InfoPresenter.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

protocol InfoPresenterDelegate: NSObjectProtocol {
}

class InfoPresenter: NSObject {
    
    private weak var delegate: InfoPresenterDelegate?
    
    init(delegate: InfoPresenterDelegate) {
        self.delegate = delegate
    }
    
    func viewDidLoad(){
    }
    
    func contactAction(){
        guard let url = URL(string: "mailto:\(RickMortyDefines.ContentServices.contactMail)")  else { return }
        UIApplication.shared.open(url)
    }
    
    func apiAction(){
        guard let url = URL(string: RickMortyDefines.ContentServices.baseUrl) else { return }
        UIApplication.shared.open(url)
    }
}
