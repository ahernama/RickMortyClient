//
//  EpisodesHeaderView.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class EpisodesHeaderView: UIView {
    
    @IBOutlet weak var headerCollapsed: UIView!
    @IBOutlet weak var headerExpanded: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    func configureWithOpacity(opacity:CGFloat){
        UIView.animate(withDuration: DevDefines.Animations.mediumAnimationTime, animations: {
            self.headerExpanded.alpha = opacity
            self.headerCollapsed.alpha = 1-opacity
        })
    }
}
