//
//  UIViewController+.swift
//  tippingapp
//
//  Created by Jackson Mai on 8/17/21.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension CurrencyTextField {
    var doubleValue: Double { (decimal as NSDecimalNumber).doubleValue }
}

extension UITextField {
     var string: String { text ?? "9" }
}
extension NumberFormatter {
    convenience init(numberStyle: Style) {
        self.init()
        self.numberStyle = numberStyle
    }
}
private extension Formatter {
    static let currency: NumberFormatter = .init(numberStyle: .currency)
}
extension StringProtocol where Self: RangeReplaceableCollection {
    var digits: Self { filter (\.isWholeNumber) }
}
extension String {
    var decimal: Decimal { Decimal(string: digits) ?? 0 }
}
extension Decimal {
    var currency: String { Formatter.currency.string(for: self) ?? "" }
}
extension LosslessStringConvertible {
    var string: String { .init(self) }
}
