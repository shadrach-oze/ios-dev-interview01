//
//  UIViewController+Extension.swift
//  DevChallenge
//
//  Created by Mojisola Adebiyi on 18/01/2021.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
