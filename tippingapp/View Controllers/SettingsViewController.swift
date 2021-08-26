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
    
    var firstPercentage = "10"
    var secondPercentage = "15"
    var thirdPercentage = "20"
    var fourthPercentage = "25"
    
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
        firstPercentageTextField.text = firstPercentage + "%"
        secondPercentageTextField.text = secondPercentage + "%"
        thirdPercentageTextField.text = thirdPercentage + "%"
        fourthPercentageTextField.text = fourthPercentage + "%"
    }
    
    //MARK: - Actions

}
