//
//  CircularImageView.swift
//  UIDesigns
//
//  Created by Shivanshu Verma on 04/11/24.
//

import UIKit

@IBDesignable
class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /// Calculate the radius based on the smaller dimension
        let radius = min(self.bounds.width, self.bounds.height) / 2
        
        /// Create a circular path
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: self.bounds.midX, y: self.bounds.midY),
            radius: radius,
            startAngle: 0,
            endAngle: CGFloat.pi * 2,
            clockwise: true
        )
        
        /// Create a shape layer with the circular path
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circularPath.cgPath
        
        /// Set the shape layer as the mask of the button
        self.layer.mask = shapeLayer
    }
}

