//
//  CharactersFlexibleHeaderContainerViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialFlexibleHeader

class CharactersFlexibleHeaderContainerViewController: MDCFlexibleHeaderContainerViewController {
    
    init(episode:RMEpisode) {
        let charactersViewController:CharactersViewController = CharactersViewController.instantiate(episode:episode)
        super.init(contentViewController: charactersViewController)
        charactersViewController.headerViewController = self.headerViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
