//
//  AlertHelper.swift
//  Pokedex
//
//  Created by Nathan Johnson on 3/12/17.
//  Copyright © 2017 Nathan Johnson. All rights reserved.
//

import UIKit

class AlertHelper {
    static func showAlert(view: UIViewController, title: String?, message: String?, closeButtonText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: closeButtonText, style: .default, handler: nil))
        view.present(alert, animated: true, completion: nil)
    }
    
    static func showErrorAlert(view: UIViewController, message: String?) {
        self.showAlert(view: view, title: "Error", message: message, closeButtonText: "OK")
    }
}
