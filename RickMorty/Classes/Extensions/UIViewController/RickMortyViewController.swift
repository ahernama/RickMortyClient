//
//  RickMortyViewController.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 31/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import DynamicBlurView

class RickMortyViewController: UIViewController {
    
    private var blurView:DynamicBlurView?
    private var indicator: NVActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.localize()
    }
}

//
// MARK: - Loading methods
//

extension RickMortyViewController{
    
    func showLoadingView(){
        if let resultIndicator = self.indicator?.isAnimating, resultIndicator == true {
            return
        }
        if self.blurView == nil {
            self.blurView = DynamicBlurView(frame: view.bounds)
            self.indicator = NVActivityIndicatorView(frame: CGRect(x: (self.view.frame.size.width-RickMortyDefines.Metrics.Common.loadingSize)/2.0, y: (self.view.frame.size.height-RickMortyDefines.Metrics.Common.loadingSize)/2.0, width: RickMortyDefines.Metrics.Common.loadingSize, height: RickMortyDefines.Metrics.Common.loadingSize), type: NVActivityIndicatorType.ballScaleMultiple, color: RickMortyDefines.Colors.darkGreen, padding: nil)
            self.blurView?.addSubview(self.indicator!)
            self.blurView?.blurRadius = 10
            self.view.addSubview(self.blurView!)
        }
        self.indicator?.startAnimating()
        self.blurView?.alpha = 0.0
        self.blurView?.isHidden = false
        UIView.animate(withDuration: DevDefines.Animations.quickAnimationTime, animations: {
            self.blurView?.alpha = 1.0
        }) { (completion) in
        }
    }
    
    func hideLoadingView(completionLoading:@escaping (Bool?) -> Void){
        guard self.blurView != nil else {
            return
        }
        UIView.animate(withDuration: DevDefines.Animations.quickAnimationTime, animations: {
            self.blurView?.alpha = 0.0
        }) { (completion) in
            self.indicator?.stopAnimating()
            self.blurView?.isHidden = true
            completionLoading(true)
        }
    }
}
