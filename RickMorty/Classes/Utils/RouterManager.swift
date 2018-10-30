//
//  RouterManager.swift
//  iOS-Starter-Kit
//
//  Created by Nghia Tran on 12/21/16.
//  Copyright © 2016 nghiatran. All rights reserved.
//

import Foundation
import UIKit

class RouterManager {
    
    //
    // MARK: - Variable
    static let shared = RouterManager()
    
    //
    // MARK: - Initialize
    init() {
        
    }
    //
    // MARK: - helper
    var rootViewController: UIViewController? {
        let app = UIApplication.shared.delegate as! AppDelegate
        return app.window?.rootViewController
    }
    
    var visibleNavigationController: UINavigationController? {
        return self.visibleViewController?.navigationController
    }
    
    var visibleViewController: UIViewController? {
        guard let rootViewController = self.rootViewController else {return nil}
        
        // Present
        if let presentedVC = rootViewController.presentedViewController {
            if let navi = presentedVC as? UINavigationController {
                return navi.visibleViewController
            }else{
                if let seconDpresentedVC = presentedVC.presentedViewController {
                    if let navi = seconDpresentedVC as? UINavigationController {
                        return navi.visibleViewController
                    }else{
                        return seconDpresentedVC
                    }
                }else{
                    return presentedVC
                }
            }
        }
        
        // Navi
        if let navi = rootViewController as? UINavigationController {
            return navi.visibleViewController
        }
        
        return rootViewController
    }
    
    func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
