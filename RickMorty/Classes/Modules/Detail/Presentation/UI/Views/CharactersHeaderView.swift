//
//  CharactersHeaderView.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 1/11/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

protocol CharactersHeaderViewDelegate: NSObjectProtocol {
    func backAction()
    func filterSelection(filter:String)
}

class CharactersHeaderView: UIView {
    weak var delegate: CharactersHeaderViewDelegate?
    
    @IBOutlet weak var segmented: UISegmentedControl!
    
    @IBOutlet weak var headerCollapsed: UIView!
    @IBOutlet weak var headerExpanded: UIView!

    @IBOutlet weak var labelTitleExpanded: UILabel!
    @IBOutlet weak var labelTitleCollapsed: UILabel!
    
    private var filters:[String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.localize()
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.delegate?.backAction()
    }
    
    @IBAction  func valueChanged(_ sender: UISegmentedControl){
        self.delegate?.filterSelection(filter: self.filters[sender.selectedSegmentIndex])
    }
    
    func configureWithEpisode(episode:RMEpisode){
        self.labelTitleExpanded.text = episode.nameEpisode
        self.labelTitleCollapsed.text = episode.nameEpisode
    }
    
    func configureWithStatus(status:[String]){
        segmented.alpha = 1.0
        segmented.removeAllSegments()
        self.filters = status
        var segmentPosition = 0
        for currentStatus in status {
            var titleFilter = String.filter_all
            if currentStatus == RickMortyDefines.ContentServices.Characters.alive{
                titleFilter = String.filter_alive
            }else if currentStatus == RickMortyDefines.ContentServices.Characters.death{
                titleFilter = String.filter_death
            }else if currentStatus == RickMortyDefines.ContentServices.Characters.unknown{
                titleFilter = String.filter_unknown
            }
            segmented.insertSegment(withTitle: titleFilter, at:segmentPosition , animated: false)
            segmentPosition+=1
        }
        segmented.selectedSegmentIndex = 0
    }
    
    func configureWithOpacity(opacity:CGFloat){
        UIView.animate(withDuration: DevDefines.Animations.mediumAnimationTime, animations: {
            self.headerExpanded.alpha = opacity
            self.headerCollapsed.alpha = 1-opacity
        })
    }
}
