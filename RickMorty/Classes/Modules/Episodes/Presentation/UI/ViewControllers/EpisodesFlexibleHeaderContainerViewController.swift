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
        episodesViewController.view.frame = CGRect(x: episodesViewController.view.frame.origin.x, y: episodesViewController.view.frame.origin.y, width: episodesViewController.view.frame.size.width, height: episodesViewController.view.frame.size.height)
        episodesViewController.configueHeaderView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
