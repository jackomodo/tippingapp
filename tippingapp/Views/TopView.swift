//
//  TopView.swift
//  tippingapp
//
//  Created by Jackson Mai on 8/17/21.
//

import UIKit

class TopView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        customizeButton()
    }

    func customizeButton() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 3
    }

}
