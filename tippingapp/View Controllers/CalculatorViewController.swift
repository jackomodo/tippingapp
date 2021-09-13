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
    @IBOutlet weak var firstPercentageLabel: UILabel!
    @IBOutlet weak var secondPercentageLabel: UILabel!
    @IBOutlet weak var thirdPercentageLabel: UILabel!
    @IBOutlet weak var fourthPercentageLabel: UILabel!
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
        NotificationCenter.default.addObserver(self,
               selector: #selector(self.keyboardNotification(notification:)),
               name: UIResponder.keyboardWillChangeFrameNotification,
               object: nil)
        registerUserDefaults()
        updateViews()
    }
    
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?

    
    deinit {
      NotificationCenter.default.removeObserver(self)
    }
  
    @objc func keyboardNotification(notification: NSNotification) {
      guard let userInfo = notification.userInfo else { return }

      let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
      let endFrameY = endFrame?.origin.y ?? 0
      let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
      let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
      let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
      let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)

      if endFrameY >= UIScreen.main.bounds.size.height {
        self.keyboardHeightLayoutConstraint?.constant = 0.0
      } else {
        self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 0.0
      }

      UIView.animate(
        withDuration: duration,
        delay: TimeInterval(0),
        options: animationCurve,
        animations: { self.view.layoutIfNeeded() },
        completion: nil)
    }
    
    //MARK: - Functions
    
    func updateViews() {
        
        firstPercentageLabel.text = String(Tip.instance.firstPercentageAmount.removeZerosFromEnd()) + "%"
        secondPercentageLabel.text = String(Tip.instance.secondPercentageAmount.removeZerosFromEnd()) + "%"
        thirdPercentageLabel.text = String(Tip.instance.thirdPercentageAmount.removeZerosFromEnd()) + "%"
        fourthPercentageLabel.text = String(Tip.instance.fourthPercentageAmount.removeZerosFromEnd()) + "%"
        tipAmountTextField.text = String(format: "%0.2f", round(100 * tipAmount) / 100)
        tipPercentageTextField.text = String(round(100 * tipPercentage) / 100) + "%"
        splitBillTextField.text = String(splitBillAmount.removeZerosFromEnd())
        totalAmountLabel.text = String(format: "%0.2f", round(100 * (billAmount + tipAmount)) / 100)
        eachPayLabel.text = String(format: "%0.2f", round(100 * (billAmount + tipAmount)  / splitBillAmount) / 100)
        print("view updated")
    }
    
    func calculateTip() {
        if billAmountTextField.doubleValue != 0.0 {
            tipPercentage = tipAmount / billAmount * 100
        }
    }
    
    func registerUserDefaults() {
        if UserDefaults.standard.value(forKey: UserDefaultKeys.firstKey) == nil {
            UserDefaults.standard.setValue(10.0, forKey: UserDefaultKeys.firstKey)
        }
        if UserDefaults.standard.value(forKey: UserDefaultKeys.secondKey) == nil {
            UserDefaults.standard.setValue(15.0, forKey: UserDefaultKeys.secondKey)
        }
        if UserDefaults.standard.value(forKey: UserDefaultKeys.thirdKey) == nil {
            UserDefaults.standard.setValue(20.0, forKey: UserDefaultKeys.thirdKey)
        }
        if UserDefaults.standard.value(forKey: UserDefaultKeys.fourthKey) == nil {
            UserDefaults.standard.setValue(25.0, forKey: UserDefaultKeys.fourthKey)
        }
    }
    
    //MARK: - Actions

    @IBAction func firstPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = billAmount * Tip.instance.firstPercentageAmount / 100
            tipPercentage = tipAmount / billAmount * 100
            print(tipAmount)
            updateViews()
        }
        
    }
    
    @IBAction func secondPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = billAmount * Tip.instance.secondPercentageAmount / 100
            tipPercentage = tipAmount / billAmount * 100
            updateViews()
        }
    }
    @IBAction func thirdPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = billAmount * Tip.instance.thirdPercentageAmount / 100
            tipPercentage = tipAmount / billAmount * 100
            updateViews()
        }
    }
    @IBAction func fourthPercentageButtonPressed(_ sender: Any) {
        if billAmountTextField.doubleValue != 0.0 {
            billAmount = billAmountTextField.doubleValue
            tipAmount = billAmount * Tip.instance.fourthPercentageAmount / 100
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
        tipPercentage = Double(tipPercentageTextField.text!) ?? tipPercentage
        if tipPercentageTextField.text == nil {
            tipPercentageTextField.text = String(round(100 * tipPercentage) / 100) + "%"
        }
        updateViews()
    }
    
    @IBAction func splitBillEntered(_ sender: Any) {
        splitBillAmount = Double(splitBillTextField.text!) ?? splitBillAmount
        if splitBillAmount == 0.0 {
            splitBillAmount += 1.0
        }
        updateViews()
    }
    
    
}

