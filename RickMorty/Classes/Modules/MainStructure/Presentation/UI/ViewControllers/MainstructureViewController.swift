//
//  ViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 29/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class MainstructureViewController: UITabBarController {
    
    fileprivate lazy var mainstructurePresenter: MainstructurePresenter = MainstructurePresenter(delegate: self)
    
    fileprivate var currentTabbarIndicator:UIView?
    
    static func instantiate() -> MainstructureViewController{
        let mainstructureStoryBoard = UIStoryboard(name: "Mainstructure", bundle: nil)
        let mainstructureViewController = mainstructureStoryBoard.instantiateViewController(withIdentifier: "mainstructureViewController") as! MainstructureViewController
        return mainstructureViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainstructurePresenter.viewDidLoad()
    }
    
    //UITabBarController methods
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let currentIndex = tabBar.items?.index(of: item){
            UIView.animate(withDuration: DevDefines.Animations.mediumAnimationTime, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 3, options: .curveEaseInOut, animations: {
                self.currentTabbarIndicator?.frame = CGRect(x: (DevDefines.Metrics.widhtScreen/CGFloat(RickMortyDefines.Tabbar.numTabs))*CGFloat(currentIndex), y: CGFloat(RickMortyDefines.Tabbar.positionYInsideIndicator), width: DevDefines.Metrics.widhtScreen/CGFloat(RickMortyDefines.Tabbar.numTabs), height: CGFloat(RickMortyDefines.Tabbar.heightInsideIndicator))
            })
        }
    }
}

extension MainstructureViewController: MainstructurePresenterDelegate {
    
    //Configuration view methods
    func configureBottomTabBar(){
        self.delegate = delegate
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: RickMortyDefines.Fonts.avenir_book_10!], for: .normal)
        
        let episodesFlexibleHeaderContainerViewController = EpisodesFlexibleHeaderContainerViewController()
        let navigationEpisodes = UINavigationController(rootViewController: episodesFlexibleHeaderContainerViewController)
        navigationEpisodes.isNavigationBarHidden = true
        episodesFlexibleHeaderContainerViewController.tabBarItem = UITabBarItem(title: String.tabs_1, image: UIImage(named:"computer")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:"computer"))
        episodesFlexibleHeaderContainerViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        
        let infoViewController = InfoViewController.instantiate()
        let navigationInfo = UINavigationController(rootViewController: infoViewController)
        infoViewController.tabBarItem = UITabBarItem(title: String.tabs_2, image: UIImage(named:"user")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named:"user"))
        infoViewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        
        self.viewControllers = [navigationEpisodes,navigationInfo]
        self.tabBar.tintColor = RickMortyDefines.Colors.darkGreen
    }
    
    func configureBottomLineIndicator(){
        self.currentTabbarIndicator = UIView(frame: CGRect(x: 0.0, y: Double(RickMortyDefines.Tabbar.positionYInsideIndicator), width: Double(DevDefines.Metrics.widhtScreen/CGFloat(RickMortyDefines.Tabbar.numTabs)), height: RickMortyDefines.Tabbar.heightInsideIndicator))
        let insideColor:UIView = UIView(frame: CGRect(x: Double(RickMortyDefines.Tabbar.offsetInsideIndicator), y: 0.0, width: (Double(DevDefines.Metrics.widhtScreen)/Double(RickMortyDefines.Tabbar.numTabs))-(RickMortyDefines.Tabbar.offsetInsideIndicator*2), height: RickMortyDefines.Tabbar.heightInsideIndicator))
        insideColor.backgroundColor = RickMortyDefines.Colors.darkGreen
        insideColor.cornerRadius = 1.0
        self.currentTabbarIndicator?.addSubview(insideColor)
        self.currentTabbarIndicator?.backgroundColor = UIColor.clear
        self.tabBar.addSubview(self.currentTabbarIndicator!)
    }
}

