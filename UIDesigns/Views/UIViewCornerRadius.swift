//
//  Vui.swift
//  UIDesigns
//
//  Created by Shivanshu Verma on 02/11/24.
//

import UIKit

@IBDesignable
class UIViewCornerRadius: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
    }
}

