//
//  UtilAlerts.swift
//  pitch-perfect
//
//  Created by Amadeu Andrade on 04/06/16.
//  Copyright © 2016 Amadeu Andrade. All rights reserved.
//

import UIKit

class UtilAlerts {
    
    struct PermissionAlerts {
        static let PermissionDenied = "Permission to record not granted."
    }
    
    func showAlert(delegate: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
        delegate.presentViewController(alert, animated: true, completion: nil)
    }
    
}