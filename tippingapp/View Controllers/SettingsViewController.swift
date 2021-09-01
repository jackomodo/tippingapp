//
//  SettingsViewController.swift
//  tippingapp
//
//  Created by Jackson Mai on 8/19/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - IBOutlets

    @IBOutlet weak var firstPercentageTextField: UITextField!
    @IBOutlet weak var secondPercentageTextField: UITextField!
    @IBOutlet weak var thirdPercentageTextField: UITextField!
    @IBOutlet weak var fourthPercentageTextField: UITextField!
    @IBOutlet weak var homeButton: UIButton!
    
    //MARK: - Variables
    
    var firstPercentageAmount = 10.0
    var secondPercentageAmount = 15.0
    var thirdPercentageAmount = 20.0
    var fourthPercentageAmount = 25.0
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
        
    }
    
    //MARK: - Functions
    
    func updateViews() {
        firstPercentageTextField.text = String(firstPercentageAmount.removeZerosFromEnd()) + "%"
        secondPercentageTextField.text = String(secondPercentageAmount.removeZerosFromEnd()) + "%"
        thirdPercentageTextField.text = String(thirdPercentageAmount.removeZerosFromEnd()) + "%"
        fourthPercentageTextField.text = String(fourthPercentageAmount.removeZerosFromEnd()) + "%"
    }
    
    //MARK: - Actions

}
