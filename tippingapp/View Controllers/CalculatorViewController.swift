//
//  ViewController.swift
//  tippingapp
//
//  Created by Jackson Mai on 7/19/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var firstPercentageButton: UIButton!
    @IBOutlet weak var secondPercentageButton: UIButton!
    @IBOutlet weak var thirdPercentageButton: UIButton!
    @IBOutlet weak var fourthPercentageButton: UIButton!
    @IBOutlet weak var tipAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var splitBillTextField: UITextField!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var eachPayLabel: UILabel!
    
    //MARK: - Variables
    
    var billAmount = 0.0
    var tipAmont = 0.0
    var tipPercentage = 0.0
    var splitAmount = 0.0
    var totalAmount = 0.0
    var totalSplitAmount = 0.0
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

    }


}

