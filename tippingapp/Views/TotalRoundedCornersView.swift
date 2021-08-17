//
//  TotalRoundedCornersView.swift
//  tippingapp
//
//  Created by Jackson Mai on 8/6/21.
//

import UIKit

class TotalRoundedCornersView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeButton()
    }

    func customizeButton() {
        layer.cornerRadius = 5
    }

}
