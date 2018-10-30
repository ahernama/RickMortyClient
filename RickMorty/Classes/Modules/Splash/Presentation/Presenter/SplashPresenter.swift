//
//  SplashPresenter.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

protocol SplashPresenterDelegate: NSObjectProtocol {
    func showLoadingIndicator()
}

class SplashPresenter: NSObject {
    
    private weak var delegate: SplashPresenterDelegate?
    
    init(delegate: SplashPresenterDelegate) {
        self.delegate = delegate
    }
    
    //Life cycle methods
    func viewDidLoad(){
        self.delegate?.showLoadingIndicator()
        self.requestConfigurationInfo()
    }
    
    //RequestConfiguration methods
    func requestConfigurationInfo() {
        DispatchQueue.main.asyncAfter(deadline: .now() + DevDefines.Delay.delayToRemoveSplash) {
            self.transitionToMainStructure()
        }
    }
}

//
// MARK: - Transition Methods
//

extension SplashPresenter{
    
    func transitionToMainStructure(){
        let mainstructureViewController:MainstructureViewController = MainstructureViewController.instantiate()
        RouterManager.shared.visibleViewController?.present(mainstructureViewController, animated: true, completion: {
        })
    }
}
