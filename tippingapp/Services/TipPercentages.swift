//
//  TipPercentages.swift
//  tippingapp
//
//  Created by Jackson Mai on 9/7/21.
//

import Foundation

class Tip {
    static let instance = Tip()
    
    var firstPercentageAmount = UserDefaults.standard.double(forKey: UserDefaultKeys.firstKey)
    var secondPercentageAmount = UserDefaults.standard.double(forKey: UserDefaultKeys.secondKey)
    var thirdPercentageAmount = UserDefaults.standard.double(forKey: UserDefaultKeys.thirdKey)
    var fourthPercentageAmount = UserDefaults.standard.double(forKey: UserDefaultKeys.fourthKey)
    
}

