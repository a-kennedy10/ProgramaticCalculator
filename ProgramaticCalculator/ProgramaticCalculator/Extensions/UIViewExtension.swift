//
//  UIViewExtension.swift
//  ProgramaticCalculator
//
//  Created by Alex Kennedy on 10/13/20.
//  Copyright © 2020 Alex Kennedy. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, topPadding: CGFloat,
                bottomPadding: CGFloat, leadingPadding: CGFloat, trailingPadding: CGFloat,
                width: CGFloat? = nil, height: CGFloat? = nil) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: topPadding).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: bottomPadding).isActive = true
        }
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading, constant: leadingPadding).isActive = true
        }
        
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing, constant: trailingPadding).isActive = true
        }
        
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}


struct SpacingConstants {
    static let mediumHorizontalBuffer: CGFloat = 40.0
    static let smallHorizontalBuffer: CGFloat = 8.0
    static let smallVerticalBuffer: CGFloat = 8.0
    static let mediumVerticalBuffer: CGFloat = 24.0
    static let largeVerticalBuffer: CGFloat = 200.0
    static let titleHeight: CGFloat = 30.0
    static let subtitleHeight: CGFloat = 20.0
    static let textFieldHeight: CGFloat = 25.0
}
