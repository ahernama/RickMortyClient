//
//  CharactersTableViewCell.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 1/11/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import AlamofireImage

class CharactersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var titleCharacters: UILabel!
    @IBOutlet weak var statusCharacters: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWithCharatcer(character:RMCharacter){
        self.imageCharacter.image = nil
        
        self.titleCharacters.text = character.nameCharacter
        self.statusCharacters.text = character.status
        
        if let imageUrl =  URL(string:character.image){
            self.imageCharacter.af_setImage(withURL: imageUrl)
        }
    }
}
