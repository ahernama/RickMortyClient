//
//  DevDefines.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

class DevDefines: NSObject {
    
    static let datbaseVersion = 1.0
    
    struct Services{
        static let correct_code_http = 200
    }
    struct Metrics{
        static let is_iPhone = (UI_USER_INTERFACE_IDIOM() == .phone)
        static let isIphoneX = (is_iPhone && UIScreen.main.bounds.size.height == 812.0)
        
        static let widhtScreen = UIScreen.main.bounds.width
        static let heightScreen = UIScreen.main.bounds.height
    }
    
    struct Animations{
        static let shortAnimationTime = 0.2
        static let quickAnimationTime = 0.3
        static let mediumAnimationTime = 0.5
        static let mediumAnimationTimePlus = 0.7
        static let mediumAnimationTimePlus2 = 0.7
        static let longAnimationTime = 1.0
    }
    struct Delay{
        static let delayToRemoveSplash = 2.0
        static let delayToTestPageRequest = 1.0
    }
}
