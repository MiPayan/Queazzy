//
//  UIButton.swift
//  Queazzy
//
//  Created by Mickael PAYAN on 03/07/2023.
//

import UIKit

extension UIButton {
    
    
    func makeShadow() {
        layer.shadowColor = UIColor(named: "ColorBorderButton")?.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 1
    }
    
    func makeBorder() {
        layer.borderColor = UIColor(named: "ColorBorderButton")?.cgColor
        layer.borderWidth = 2
    }
}
