//
//  String+Localized.swift
//  RickMorty
//
//  Created by Alejandro Hernández Matías on 30/10/18.
//  Copyright © 2018 Alejandro Hernández Matías. All rights reserved.
//

import UIKit

func NSLocalizedString(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

extension String {
    
    //MARK: Tabs Screen
    static let tabs_1 = NSLocalizedString("tabs_1")
    static let tabs_2 = NSLocalizedString("tabs_2")
    
    //Generic Screen
    static let generic_error = NSLocalizedString("generic_error")
    static let generic_accept = NSLocalizedString("generic_accept")
    static let generic_cancel = NSLocalizedString("generic_cancel")
    static let generic_and = NSLocalizedString("generic_and")
}
