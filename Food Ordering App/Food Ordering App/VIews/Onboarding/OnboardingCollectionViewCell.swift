//
//  OnboardingCollectionViewCell.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 28/8/2567 BE.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var screenDescriptionLabel: UILabel!
    
    func setup(_ screen: OnboardingScreens) {
        screenTitleLabel.text = screen.title
        screenDescriptionLabel.text = screen.description
        imageView.image = screen.image
    }
}
