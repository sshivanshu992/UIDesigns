//
//  UIView+Addition.swift
//  UIDesigns
//
//  Created by Shivanshu Verma on 02/11/24.
//

import UIKit

extension UIView {
    
    /// Rounds specific corners of the view
    /// - Parameters:
    ///   - corners: Corners to be rounded (e.g., [.topLeft, .bottomRight])
    ///   - radius: Radius of the rounding
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    /// Rounds specific corners of the view
    /// - Parameters:
    ///   - corners: Corners to be rounded (e.g., [.layerMinXMinYCorner, .layerMaxXMaxYCorner])
    ///   - radius: Radius of the rounding
    func roundCornersUsingMaskedCorners(corners: CACornerMask, radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
        self.layer.masksToBounds = true
    }
}

extension UIView {
    /// Applies a circular mask to the view based on its smallest dimension.
    func makeCircular() {
        /// Ensure the view has a square frame (equal width and height)
        layoutIfNeeded() // Makes sure layout is up-to-date
        
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
        
        /// Set the shape layer as the mask of the view
        self.layer.mask = shapeLayer
    }
}
