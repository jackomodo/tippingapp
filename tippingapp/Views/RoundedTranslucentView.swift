//
//  RoundedTranslucentView.swift
//  tippingapp
//
//  Created by Jackson Mai on 7/20/21.
//

import UIKit

class RoundedTranslucentView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeButton()
    }

    func customizeButton() {
        layer.cornerRadius = 20
    }

}
