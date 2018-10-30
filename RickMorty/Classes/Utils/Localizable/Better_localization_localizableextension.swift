//
//  Better_localization_localizableextension.swift
//  Aluzina
//
//  Created by Alejandro Hernández Matías on 20/2/18.
//  Copyright © 2018 aluzina. All rights reserved.
//

import UIKit

public extension Localizable {
    
    public func localize(_ string: String?) -> String? {
        guard let term = string, term.hasPrefix("@") else {
            return string
        }
        guard !term.hasPrefix("@@") else {
            return String(term.dropFirst())
        }
        return NSLocalizedString(String(term.dropFirst()), comment: "")
    }
    
    public func localize(_ string: String?, _ setter: (String?) -> Void) {
        setter(localize(string))
    }
    
    public func localize(_ getter: (UIControl.State) -> String?, _ setter: (String?, UIControl.State) -> Void) {
        setter(localize(getter(.normal)), .normal)
        setter(localize(getter(.selected)), .selected)
        setter(localize(getter(.highlighted)), .highlighted)
        setter(localize(getter(.disabled)), .disabled)
    }
}
