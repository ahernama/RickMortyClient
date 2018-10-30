//
//  SplashViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SplashViewController: UIViewController {
    
    fileprivate lazy var splashPresenter: SplashPresenter = SplashPresenter(delegate: self)
    @IBOutlet weak var indicatorSplash: NVActivityIndicatorView!
    
    static func instantiate() -> SplashViewController{
        let splashStoryBoard = UIStoryboard(name: "Splash", bundle: nil)
        let splashViewController = splashStoryBoard.instantiateViewController(withIdentifier: "splashViewController") as! SplashViewController
        return splashViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.splashPresenter.viewDidLoad()
    }
}

extension SplashViewController: SplashPresenterDelegate {

    func showLoadingIndicator(){
        self.indicatorSplash.startAnimating()
        self.indicatorSplash.alpha = 1.0
    }
}
