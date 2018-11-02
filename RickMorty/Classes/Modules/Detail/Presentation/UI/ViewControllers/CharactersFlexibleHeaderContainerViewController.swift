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
    
    var needLightStatus:Bool = false
    
    init(episode:RMEpisode) {
        let charactersViewController:CharactersViewController = CharactersViewController.instantiate(episode:episode)
        super.init(contentViewController: charactersViewController)
        charactersViewController.delegate = self
        charactersViewController.headerViewController = self.headerViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if self.needLightStatus{
            return .lightContent
        }else{
            return .default
        }
    }
}

extension  CharactersFlexibleHeaderContainerViewController: CharactersViewControllerDelegate {
    
    func changeStatusBarColor(needWhite: Bool) {
        if needWhite {
            if self.needLightStatus{
                return
            }else{
                self.needLightStatus = true
                self.setNeedsStatusBarAppearanceUpdate()
            }
        }else{
            if self.needLightStatus{
                self.needLightStatus = false
                self.setNeedsStatusBarAppearanceUpdate()
            }
        }
    }
}
