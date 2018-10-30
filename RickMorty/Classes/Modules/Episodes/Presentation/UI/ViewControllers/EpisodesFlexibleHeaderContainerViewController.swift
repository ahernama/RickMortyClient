//
//  EpisodesFlexibleHeaderContainerViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialFlexibleHeader

class EpisodesFlexibleHeaderContainerViewController: MDCFlexibleHeaderContainerViewController {
    
    init() {
        let episodesViewController:EpisodesViewController = EpisodesViewController.instantiate()
        
        super.init(contentViewController: episodesViewController)
        episodesViewController.headerViewController = self.headerViewController
        episodesViewController.setupHeaderView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
