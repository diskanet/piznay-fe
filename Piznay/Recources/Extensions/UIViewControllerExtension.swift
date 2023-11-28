//
//  UIViewControllerExtension.swift
//  Piznay
//
//  Created by Dima Kahanets on 20.11.2023.
//

import UIKit
import MapKit

extension UIViewController {
    func hideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    func showAlertMessage(title: String, message: String, _ completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let gotItButton = UIAlertAction(title: "Got it", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(gotItButton)
        self.present(alert, animated: true) 
    }
    
    func presentBottomSheet(viewController: BasicBottomSheetVC) {
            viewController.modalPresentationStyle = .overFullScreen
            present(viewController, animated: false, completion: nil)
        }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

