//
//  EpisodesViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialFlexibleHeader

class EpisodesViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }
    
    // Flexible headerview configuration.
    func setupHeaderView() {
        self.loadHeaderView()
        
        let headerView = headerViewController.headerView
        headerView.trackingScrollView = self.collectionView
        headerView.maximumHeight = 440
        headerView.minimumHeight = 72
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
}

extension EpisodesViewController: EpisodesPresenterDelegate {
}
