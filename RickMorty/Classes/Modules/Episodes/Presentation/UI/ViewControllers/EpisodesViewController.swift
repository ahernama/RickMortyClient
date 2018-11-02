//
//  EpisodesViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialFlexibleHeader

class EpisodesViewController: RickMortyViewController {
    
    var headerViewController: MDCFlexibleHeaderViewController!
    fileprivate var headerContentView:EpisodesHeaderView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate lazy var episodesPresenter: EpisodesPresenter = EpisodesPresenter(delegate: self)
    
    static func instantiate() -> EpisodesViewController{
        let episodesStoryBoard = UIStoryboard(name: "Episodes", bundle: nil)
        let episodesViewController = episodesStoryBoard.instantiateViewController(withIdentifier: "episodesViewController") as! EpisodesViewController
        return episodesViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.episodesPresenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.episodesPresenter.viewWillAppear()
        collectionView?.collectionViewLayout.invalidateLayout()
    }
}

extension EpisodesViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.episodesPresenter.numEpisodes(currentSection: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.episodesPresenter.numSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section != RickMortyDefines.CollectionViews.EpisodesList.sectionLoading {
            self.episodesPresenter.selectedCurrentPosition(position: indexPath.row)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell:UICollectionViewCell? = nil
        if indexPath.section == RickMortyDefines.CollectionViews.EpisodesList.sectionLoading {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "loadingCollectionViewCell", for: indexPath) as! LoadingCollectionViewCell
            if let currentCell = cell as? LoadingCollectionViewCell{
                currentCell.interactLoadingAction()
            }
        }else{
            if self.episodesPresenter.needChangeSection(episodeIndex: indexPath.row){
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeSectionCollectionViewCell", for: indexPath) as! EpisodeSectionCollectionViewCell
                if let currentCell = cell as? EpisodeSectionCollectionViewCell, let currentEpisode = self.episodesPresenter.currentEpisode(position: indexPath.row){
                    currentCell.configureWithEpisode(episode: currentEpisode, numSeason: self.episodesPresenter.getSeasonNumberByIndex(indexPath.row))
                }
            }else{
                cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeCollectionViewCell", for: indexPath) as! EpisodeCollectionViewCell
                if let currentCell = cell as? EpisodeCollectionViewCell, let currentEpisode = self.episodesPresenter.currentEpisode(position: indexPath.row){
                    currentCell.configureWithEpisode(episode: currentEpisode)
                }
            }
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == RickMortyDefines.CollectionViews.EpisodesList.sectionLoading {
            return CGSize(width: DevDefines.Metrics.widhtScreen, height: RickMortyDefines.CollectionViews.EpisodesList.heightLoading)
        }else{
            if self.episodesPresenter.needChangeSection(episodeIndex: indexPath.row){
                return CGSize(width: DevDefines.Metrics.widhtScreen, height: RickMortyDefines.CollectionViews.EpisodesList.heightEpisodeCellSection)
            }else{
                return CGSize(width: DevDefines.Metrics.widhtScreen, height: RickMortyDefines.CollectionViews.EpisodesList.heightEpisodeCell)
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.headerViewController.scrollViewDidScroll(scrollView)
        
        let scrollOffsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        var opacity: CGFloat = 1.0
        if scrollOffsetY > -(RickMortyDefines.Metrics.EpisodesList.headerMax/2.0) {
            opacity = 0
        }
        self.headerContentView.configureWithOpacity(opacity: opacity)
        
        if contentHeight > 0 && (scrollOffsetY > contentHeight - (self.collectionView.frame.height * RickMortyDefines.CollectionViews.EpisodesList.scrollToRequestNewItemsParam)) {
            self.episodesPresenter.requestNextItems()
        }
    }
    
    @objc func refreshEpisodes(_ sender: Any) {
        self.episodesPresenter.refreshList()
    }
}


// EpisodesPresenterDelegate methods.
extension EpisodesViewController: EpisodesPresenterDelegate {
    
    // Flexible headerview configuration.
    func configueHeaderView() {
        self.loadHeaderView()
        
        let headerView = headerViewController.headerView
        headerView.trackingScrollView = self.collectionView
        headerView.maximumHeight = RickMortyDefines.Metrics.EpisodesList.headerMax
        headerView.minimumHeight = RickMortyDefines.Metrics.EpisodesList.headerMin
        headerView.minMaxHeightIncludesSafeArea = false
        headerView.backgroundColor = UIColor.white
        headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerContentView.frame = (headerView.bounds)
        headerContentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerView.addSubview(headerContentView)
    }
    
    func loadHeaderView() {
        if let views = Bundle.main.loadNibNamed("EpisodesHeaderView", owner: self, options: nil) as? [EpisodesHeaderView], views.count > 0, let currentView = views.first{
            self.headerContentView = currentView
        }
    }
    
    // Header View methods.
    func sizeHeaderView() {
        let headerView = headerViewController.headerView
        let bounds = UIScreen.main.bounds
        if bounds.size.width < bounds.size.height {
            headerView.maximumHeight = RickMortyDefines.Metrics.EpisodesList.headerMax
        } else {
            headerView.maximumHeight = RickMortyDefines.Metrics.EpisodesList.headerMin
        }
        headerView.minimumHeight = RickMortyDefines.Metrics.EpisodesList.headerMin
    }
    
    // CollectionView configuration.
    func configureCollectionView() {
        self.collectionView.register(UINib(nibName: "EpisodeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "episodeCollectionViewCell")
        self.collectionView.register(UINib(nibName: "LoadingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "loadingCollectionViewCell")
        self.collectionView.register(UINib(nibName: "EpisodeSectionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "episodeSectionCollectionViewCell")
        self.collectionView.reloadData()
    }
    
    // Loading methods.
    func showLoadingIndicator(){
        self.showLoadingView()
    }
    
    func hideLoadingIndicator(){
        self.hideLoadingView(completionLoading: { (completed) in
        })
    }
    
    // Load data methods.
    func loadEpisodes(_ indexPaths:[IndexPath], needClear:Bool){
        if needClear{
            self.collectionView.reloadData()
            return
        }
        self.collectionView.performBatchUpdates({
            self.collectionView.insertItems(at: indexPaths)
        }) { (completion) in
        }
    }
    
    func loadCollectionLoading(){
        self.collectionView.reloadSections(IndexSet(integer: 1))
    }
}
