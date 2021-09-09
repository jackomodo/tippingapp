//
//  PercentageButtonView.swift
//  tippingapp
//
//  Created by Jackson Mai on 8/4/21.
//

import UIKit

class PercentageButtonView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeButton()
    }

    func customizeButton() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }

}
