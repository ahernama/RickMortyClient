//
//  CharactersViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialFlexibleHeader

protocol CharactersViewControllerDelegate: NSObjectProtocol {
    func changeStatusBarColor(needWhite:Bool)
}

class CharactersViewController: RickMortyViewController {
    
    var headerViewController: MDCFlexibleHeaderViewController!
    fileprivate var headerContentView:CharactersHeaderView!
    
    weak var delegate:CharactersViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate lazy var charactersPresenter: CharactersPresenter = CharactersPresenter(delegate: self)
    
    static func instantiate(episode:RMEpisode) -> CharactersViewController{
        let episodesStoryBoard = UIStoryboard(name: "Characters", bundle: nil)
        let charactersViewController = episodesStoryBoard.instantiateViewController(withIdentifier: "charactersViewController") as! CharactersViewController
        charactersViewController.charactersPresenter.episode = episode
        return charactersViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.charactersPresenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.charactersPresenter.viewWillAppear()
    }
}

extension CharactersViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.charactersPresenter.numCharacters(currentSection:section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = nil
        cell = tableView.dequeueReusableCell(withIdentifier: "charactersTableViewCell", for: indexPath) as! CharactersTableViewCell
        if let currentCell = cell as? CharactersTableViewCell, let currentCharacter = self.charactersPresenter.currentCharacter(position: indexPath.row){
            currentCell.configureWithCharatcer(character: currentCharacter)
        }
        return cell!
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.headerViewController.scrollViewDidScroll(scrollView)
        let scrollOffsetY = scrollView.contentOffset.y
        
        /* Check if we need to change from expanded to collapsed navbar */
        var opacity: CGFloat = 1.0
        if scrollOffsetY > -(RickMortyDefines.Metrics.CharacterList.headerMax/2.0) {
            opacity = 0
        }
        self.delegate?.changeStatusBarColor(needWhite: opacity==0)
        self.headerContentView.configureWithOpacity(opacity: opacity)
    }
}

extension CharactersViewController : CharactersPresenterDelegate {
    
    // Flexible headerview configuration.
    func configureHeaderView() {
        self.loadHeaderView()
        
        let headerView = headerViewController.headerView
        headerView.trackingScrollView = self.tableView
        headerView.maximumHeight = RickMortyDefines.Metrics.CharacterList.headerMax
        headerView.minimumHeight = RickMortyDefines.Metrics.CharacterList.headerMin
        headerView.minMaxHeightIncludesSafeArea = false
        headerView.backgroundColor = UIColor.white
        headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerContentView.frame = (headerView.bounds)
        headerContentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        headerView.addSubview(headerContentView)
    }
    
    func loadHeaderView() {
        if let views = Bundle.main.loadNibNamed("CharactersHeaderView", owner: self, options: nil) as? [CharactersHeaderView], views.count > 0, let currentView = views.first{
            self.headerContentView = currentView
            self.headerContentView.delegate = self
        }
    }
    
    func configureHeaderWithEpisode(episode:RMEpisode){
        self.headerContentView.configureWithEpisode(episode: episode)
    }
    
    func configureHeaderWithFilters(filters:[String]){
        self.headerContentView.configureWithStatus(status: filters)
    }
    
    func sizeHeaderView() {
        let headerView = headerViewController.headerView
        let bounds = UIScreen.main.bounds
        if bounds.size.width < bounds.size.height {
            headerView.maximumHeight = RickMortyDefines.Metrics.CharacterList.headerMax
        } else {
            headerView.maximumHeight = RickMortyDefines.Metrics.CharacterList.headerMin
        }
        headerView.minimumHeight = RickMortyDefines.Metrics.CharacterList.headerMin

    }
    
    // Tableview configuration.
    func configureTableView() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = RickMortyDefines.CollectionViews.CharactersList.heightCharacters
        self.tableView.register(UINib(nibName: "CharactersTableViewCell", bundle: nil), forCellReuseIdentifier: "charactersTableViewCell")
    }
    
    // Loading methods.
    func showLoadingIndicator() {
        self.showLoadingView()
    }
    
    func hideLoadingIndicator() {
        self.hideLoadingView { (completion) in
        }
    }
    
    // Load data methods.
    func loadCharacters() {
        self.tableView.reloadData()
    }
}

// Headerview delegate methods.
extension CharactersViewController : CharactersHeaderViewDelegate {
    func backAction() {
        self.charactersPresenter.backAction()
    }
    
    func filterSelection(filter:String){
        self.charactersPresenter.filterByStatus(currentStatus: filter)
    }
}
