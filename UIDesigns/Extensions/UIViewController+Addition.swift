//
//  UIViewController+Addition.swift
//  UIDesigns
//
//  Created by Shivanshu Verma on 02/11/24.
//

import UIKit

/// A protocol for handling the visibility of a container view during scroll events.
protocol ScrollVisibilityHandler: AnyObject {
    /// The view whose visibility will be managed.
    var containerView: UIView { get }
    
    /// The last recorded vertical content offset of the scroll view.
    var lastContentOffset: CGFloat { get set }
    
    /// The threshold value for determining when to show or hide the container view.
    var scrollThreshold: CGFloat { get }
    
    /// Updates the visibility of the container view based on the change in scroll position.
    func updateVisibilityOfContainerView(with difference: CGFloat)
}


extension ScrollVisibilityHandler where Self: UIViewController {
    /// Default implementation for updating visibility of the container view.
    func updateVisibilityOfContainerView(with difference: CGFloat) {
        if difference > scrollThreshold {
            /// Scrolling down, hide the view
            if !containerView.isHidden {
                containerView.isHidden = true
            }
        } else if difference < -scrollThreshold {
            /// Scrolling up, show the view
            if containerView.isHidden {
                containerView.isHidden = false
            }
        }
    }
    
    /// Call this method when the scroll view is scrolled.
    func handleScrollViewDidScroll(currentOffset: CGFloat) {
        let difference = currentOffset - lastContentOffset
        updateVisibilityOfContainerView(with: difference)
        lastContentOffset = currentOffset
    }
}
