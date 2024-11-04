//
//  CustomNavigationView.swift
//  UIDesigns
//
//  Created by Shivanshu Verma on 02/11/24.
//

import UIKit

class CustomNavigationView: UIView {
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var characterContainerView: UIView!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!

    
    func configureValue(_ welcomeText: String = "Welcome back", name: String, _ welcomeTextColor: UIColor = .black, _ nameColor: UIColor = .black, image: UIImage?) {
        self.titleLabel.text = name
        self.titleLabel.textColor = welcomeTextColor
        self.subTitleLabel.text = welcomeText
        self.subTitleLabel.textColor = nameColor
        if let image = image {
            self.profileImageView.isHidden = false
            self.characterContainerView.isHidden = true
            self.profileImageView.image = image
        }
    }
}
