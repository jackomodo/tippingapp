//
//  RoundedCornersView.swift
//  tippingapp
//
//  Created by Jackson Mai on 7/23/21.
//

import UIKit

class RoundedCornersWithShadowView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeButton()
    }

    func customizeButton() {
        layer.cornerRadius = 50
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.75
        layer.shadowOffset = .zero
        layer.shadowRadius = 2
    }

}
