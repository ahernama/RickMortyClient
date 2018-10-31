//
//  EpisodeCollectionViewCell.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelCharacters: UILabel!
    @IBOutlet weak var titleEpisode: UILabel!
    @IBOutlet weak var positionEpisode: UILabel!
    
    @IBOutlet weak var widhtCellConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
        
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.widhtCellConstraint.constant = DevDefines.Metrics.widhtScreen-20
    }
    
    func configureWithEpisode(episode:RMEpisode){
        self.titleEpisode.text = episode.nameEpisode
        self.labelCharacters.text = "\(episode.characters.count) personajes"
        
        if let currentPosition = getNumepisodeInSeadon(episode: episode.episode){
            self.positionEpisode.text = "\(currentPosition)"
        }
    }
    
    func getNumepisodeInSeadon(episode:String) -> Int?{
        let parts = episode.split(separator: "E")
        if parts.count > 1 {
            return Int(parts[1])
        }
        return 0
    }
}
