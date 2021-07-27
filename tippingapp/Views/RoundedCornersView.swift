//
//  RoundedCornersView.swift
//  tippingapp
//
//  Created by Jackson Mai on 7/27/21.
//

import UIKit

class RoundedCornersView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeButton()
    }

    func customizeButton() {
        layer.cornerRadius = 50

    }

}