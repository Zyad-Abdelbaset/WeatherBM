//
//  UIViewController+Extension.swift
//  weatherBM
//
//  Created by zyad baset on 14/01/2025.
//

import Foundation
import UIKit
//MARK: Alert Extension
extension UIViewController {
    ///Show alert in the viewcontroller
    /// - Paramters:
    ///    - title: title of alert .
    ///    - message: message to show in the alert.
    ///    - buttonTitle: the title in side button default is OK
    func presentAlert(title: String = "Warning", message: String, buttonTitle: String = "Ok"){
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
}
