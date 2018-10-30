//
//  EpisodesViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {
    
    fileprivate lazy var episodesPresenter: EpisodesPresenter = EpisodesPresenter(delegate: self)
    
    static func instantiate() -> EpisodesViewController{
        let episodesStoryBoard = UIStoryboard(name: "Episodes", bundle: nil)
        let episodesViewController = episodesStoryBoard.instantiateViewController(withIdentifier: "episodesViewController") as! EpisodesViewController
        return episodesViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension EpisodesViewController: EpisodesPresenterDelegate {
}
