//
//  Better_localization_uiviewextensions.swift
//  Aluzina
//
//  Created by Alejandro Hernández Matías on 20/2/18.
//  Copyright © 2018 aluzina. All rights reserved.
//

import UIKit

extension UIView: Localizable {
    public func localize() {
        subviews.forEach { $0.localize() }
        
        if let currentLabel = self as? UILabel {
            localize(currentLabel.text) { currentLabel.text = $0 }
        }
        if let currentButton = self as? UIButton {
            localize(currentButton.title(for:), currentButton.setTitle(_:for:))
        }
    }
}
