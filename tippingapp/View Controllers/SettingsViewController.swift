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
    
//    var firstPercentageAmount = 10.0
//    var secondPercentageAmount = 15.0
//    var thirdPercentageAmount = 20.0
//    var fourthPercentageAmount = 25.0
    
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
        firstPercentageTextField.text = String(Tip.instance.firstPercentageAmount.removeZerosFromEnd()) + "%"
        secondPercentageTextField.text = String(Tip.instance.secondPercentageAmount.removeZerosFromEnd()) + "%"
        thirdPercentageTextField.text = String(Tip.instance.thirdPercentageAmount.removeZerosFromEnd()) + "%"
        fourthPercentageTextField.text = String(Tip.instance.fourthPercentageAmount.removeZerosFromEnd()) + "%"
    }
    
    //MARK: - Actions
    @IBAction func firstPercentageEntered(_ sender: Any) {
        Tip.instance.firstPercentageAmount = Double(firstPercentageTextField.text!) ?? Tip.instance.firstPercentageAmount
        if firstPercentageTextField.text == nil {
            firstPercentageTextField.text = String(Tip.instance.firstPercentageAmount.removeZerosFromEnd()) + "%"
        }
        updateViews()
    }
    @IBAction func secondPercentageEntered(_ sender: Any) {
        Tip.instance.secondPercentageAmount = Double(secondPercentageTextField.text!) ?? Tip.instance.secondPercentageAmount
        if secondPercentageTextField.text == nil {
            secondPercentageTextField.text = String(Tip.instance.secondPercentageAmount.removeZerosFromEnd()) + "%"
        }
        updateViews()
    }
    @IBAction func thirdPercentageEntered(_ sender: Any) {
        Tip.instance.thirdPercentageAmount = Double(thirdPercentageTextField.text!) ?? Tip.instance.thirdPercentageAmount
        if thirdPercentageTextField.text == nil {
            thirdPercentageTextField.text = String(Tip.instance.thirdPercentageAmount.removeZerosFromEnd()) + "%"
        }
        updateViews()
    }
    @IBAction func fourthPercentageEntered(_ sender: Any) {
        Tip.instance.fourthPercentageAmount = Double(fourthPercentageTextField.text!) ?? Tip.instance.fourthPercentageAmount
        if fourthPercentageTextField.text == nil {
            fourthPercentageTextField.text = String(Tip.instance.fourthPercentageAmount.removeZerosFromEnd()) + "%"
        }
        updateViews()
    }
    
}
