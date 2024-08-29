//
//  UIView+Extension.swift
//  Food Ordering App
//
//  Created by SaiThaw- on 28/8/2567 BE.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
