//
//  ViewController.swift
//  tippingapp
//
//  Created by Jackson Mai on 7/19/21.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var billAmountTextField: CurrencyTextField!
    @IBOutlet weak var firstPercentageButton: UIButton!
    @IBOutlet weak var secondPercentageButton: UIButton!
    @IBOutlet weak var thirdPercentageButton: UIButton!
    @IBOutlet weak var fourthPercentageButton: UIButton!
    @IBOutlet weak var tipAmountTextField: CurrencyTextField!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var splitBillTextField: UITextField!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var eachPayLabel: UILabel!
    @IBOutlet weak var minusTipAmountButton: UIButton!
    @IBOutlet weak var addTipAmountButton: UIButton!
    @IBOutlet weak var minusTipAmountPercentageButton: UIButton!
    @IBOutlet weak var addTipAmountPercentageButton: UIButton!
    @IBOutlet weak var minusSplitBillButton: UIButton!
    @IBOutlet weak var addSplitBillButton: UIButton!
    
    //MARK: - Variables
    
    var billAmount = 0.0
    var tipAmount = 0.0
    var tipPercentage = 0.0
    var splitBillAmount = 1.0
    var totalAmount = 0.0
    var totalSplitAmount = 1.0
    var eachPayAmount = 0.0
    var firstPercentageAmount = 10.0
    var secondPercentageAmount = 15.0
    var thirdPercentageAmount = 20.0
    var fourthPercentageAmount = 25.0
    
    //MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        updateViews()
    }
    
    //MARK: - Functions
    
    func updateViews() {

        tipAmountTextField.text = String(format: "%0.2f", round(100 * tipAmount) / 100)
        tipPercentageTextField.text = String(round(100 * tipPercentage) / 100) + "%"
        splitBillTextField.text = String(splitBillAmount.removeZerosFromEnd())
        totalAmountLabel.text = String(format: "%0.2f", round(100 * (billAmount + tipAmount)) / 100)
        eachPayLabel.text = String(format: "%0.2f", round(100 * (billAmount + tipAmount)  / splitBillAmount) / 100)
        print("view updated")
    }
    
    func calculateTip() {
        tipPercentage = tipAmount / billAmount * 100
    }
    
    //MARK: - Actions

    @IBAction func firstPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = billAmount * firstPercentageAmount / 100
            tipPercentage = tipAmount / billAmount * 100
            print(tipAmount)
            updateViews()
        }
        
    }
    
    @IBAction func secondPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = billAmount * secondPercentageAmount / 100
            tipPercentage = tipAmount / billAmount * 100
            updateViews()
        }
    }
    @IBAction func thirdPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = billAmount * thirdPercentageAmount / 100
            tipPercentage = tipAmount / billAmount * 100
            updateViews()
        }
    }
    @IBAction func fourthPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = billAmount * fourthPercentageAmount / 100
            tipPercentage = tipAmount / billAmount * 100
            updateViews()
        }
    }
    @IBAction func minusTipAmountButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = tipAmountTextField.doubleValue
            if tipAmount < 1.0 {
                tipAmount = 0.0
            }
            if tipAmount >= 1.0 {
                tipAmount -= 1.0
            }
            tipPercentage = tipAmount / billAmount * 100

            updateViews()
        }
    }
    @IBAction func addTipAmountButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = tipAmountTextField.doubleValue
            tipAmount += 1.0
            tipPercentage = tipAmount / billAmount * 100
            updateViews()
        }
    }
    @IBAction func minusTipAmountPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = tipAmountTextField.doubleValue
            if tipPercentage < 1.0 {
                tipPercentage = 0.0
            }
            if tipPercentage >= 1.0 {
                tipPercentage -= 1.0
            }
            tipAmount = billAmount * tipPercentage / 100

            updateViews()
        }
    }
    @IBAction func addTipAmountPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = tipAmountTextField.doubleValue
            tipAmount = billAmount * tipPercentage / 100
            tipPercentage += 1.0
            updateViews()
        }
    }
    @IBAction func minusSplitBillButtonPressed(_ sender: Any) {
        if splitBillAmount >= 2.0 {
            splitBillAmount -= 1.0
        }
        updateViews()
    }
    @IBAction func addSplitBillButtonPressed(_ sender: Any) {
        splitBillAmount += 1.0
        updateViews()
    }

    
    @IBAction func billAmountEntered(_ sender: Any) {
        billAmount = billAmountTextField.doubleValue
        print(billAmount)
    }

    @IBAction func tipAmountEntered(_ sender: Any) {
        tipAmount = tipAmountTextField.doubleValue
        calculateTip()
        updateViews()
    }
    @IBAction func tipPercentageEntered(_ sender: Any) {
        
    }
    
    @IBAction func splitBillEntered(_ sender: Any) {
        splitBillAmount = Double(splitBillTextField.text!) ?? splitBillAmount
        if splitBillAmount == 0.0 {
            splitBillAmount += 1.0
        }
        updateViews()
    }
    
}

