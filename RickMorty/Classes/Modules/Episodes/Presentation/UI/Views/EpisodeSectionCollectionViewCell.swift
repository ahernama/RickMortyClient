//
//  EpisodeSectionCollectionViewCell.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class EpisodeSectionCollectionViewCell: EpisodeCollectionViewCell {

    @IBOutlet weak var seasonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWithEpisode(episode:RMEpisode, numSeason:Int){
        super.configureWithEpisode(episode: episode)
        self.seasonName.text = "\(String.episodes_season) \(numSeason)"
    }
}
