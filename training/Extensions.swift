//
//  Extensions.swift
//  training
//
//  Created by David Tacite on 05/06/2018.
//  Copyright © 2018 David Tacite. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style:.cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
