//
//  EpisodesPresenter.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

protocol EpisodesPresenterDelegate: NSObjectProtocol {
    func configureCollectionView()
    
    func sizeHeaderView()
    
    func showLoadingIndicator()
    func hideLoadingIndicator()
    
    func loadEpisodes(_ indexPaths:[IndexPath], needClear:Bool)
    func loadCollectionLoading()
}

class EpisodesPresenter: NSObject {
    
    private weak var delegate: EpisodesPresenterDelegate?
    
    private var currentPageRequested : Int  = RickMortyDefines.ContentServices.Episodes.defaultPage
    private lazy var episodesManager: EpisodesManager = EpisodesManager()
    
    private var episodes:[RMEpisode] = []
    
    private var fetchingMoreEpisodes = false
    private var maxPageReached = false
    
    init(delegate: EpisodesPresenterDelegate) {
        self.delegate = delegate
    }
    
    //Life cycle methods
    func viewDidLoad(){
        self.delegate?.configureCollectionView()
        
        self.delegate?.showLoadingIndicator()
        self.requestEpisodes()
    }
    
    func viewWillAppear(){
        self.delegate?.sizeHeaderView()
    }
    
    //View interaction methods
    func refreshList(){
        currentPageRequested = RickMortyDefines.ContentServices.Episodes.defaultPage
        self.requestEpisodes()
    }
    
    //collection view pagging methods
    func numEpisodes(currentSection:Int) -> Int {
        if currentSection == RickMortyDefines.CollectionViews.EpisodesList.sectionLoading {
            if self.fetchingMoreEpisodes {
                return 1
            }else{
                return 0
            }
        }
        return self.episodes.count
    }
    
    func numSections() -> Int {
        return RickMortyDefines.CollectionViews.EpisodesList.numSections
    }
    
    func currentEpisode(position:Int) -> RMEpisode? {
        if position < self.episodes.count {
            return self.episodes[position]
        }else{
            return nil
        }
    }
    
    //Request information methods
    func requestNextItems(){
        if (self.fetchingMoreEpisodes == false && self.maxPageReached == false){
            self.fetchingMoreEpisodes = true
            self.delegate?.loadCollectionLoading()
            DispatchQueue.main.asyncAfter(deadline: .now() + DevDefines.Delay.delayToTestPageRequest, execute: {
                self.requestEpisodes()
            })
        }
    }
    
    func requestEpisodes(){
        episodesManager.getEpisodesList(currentPage: currentPageRequested) { (episodes, error) in
            self.delegate?.hideLoadingIndicator()
            
            guard let currentEpisodes = episodes, currentEpisodes.isEmpty == false, error == nil else{
                if error == RickMortyError.noPageAllowed{
                    self.maxPageReached = true
                }else{
                    //Show Error and retry
                }
                self.fetchingMoreEpisodes = false
                self.delegate?.loadCollectionLoading()
                return
            }
            if let currentEpisodes = episodes {
                var paths = [IndexPath]()
                for item in 0..<currentEpisodes.count {
                    let indexPath = IndexPath(item: item + self.episodes.count, section: 0)
                    paths.append(indexPath)
                }
                if self.currentPageRequested != RickMortyDefines.ContentServices.Episodes.defaultPage {
                    self.episodes.append(contentsOf: currentEpisodes)
                }else{
                    self.episodes = currentEpisodes
                }
                self.delegate?.loadEpisodes(paths, needClear: self.currentPageRequested == RickMortyDefines.ContentServices.Episodes.defaultPage)
                self.currentPageRequested += 1
            }
            self.fetchingMoreEpisodes = false
            self.delegate?.loadCollectionLoading()
        }
    }
    
    func needChangeSection(episodeIndex:Int) -> Bool{
        if episodeIndex == 0 || (getSeasonNumberByIndex(episodeIndex) != getSeasonNumberByIndex(episodeIndex-1)) {
            return true
        }
        return false
    }
    
    func getSeasonNumberByIndex(_ index:Int) -> Int{
        if index < self.episodes.count {
            return getSeasonNumber(episode: self.episodes[index].episode)
        }else{
            return 0
        }
    }
    
    func getSeasonNumber(episode:String) -> Int{
        let parts = episode.split(separator: "E")
        if parts.count > 1 {
            let seasonName = parts[0].replacingOccurrences(of: "S", with: "")
            if let currentNumber = Int(seasonName){
                return currentNumber
            }
        }
        return 0
    }
}
