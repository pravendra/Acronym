//
//  CustomAlertController.swift
//  Walmart_labs_assesment
//
//  Created by Praven on 2/17/17.
//  Copyright © 2017 Pravendra Singh. All rights reserved.
//

import UIKit

// alertAction enum for OK and Cancel button
enum alertAction {
    case OK
    case Cancel
}

// adding showAction method to UIAlertController
extension UIAlertController {
    
    // class function for showing alertView with completionHandler block
    class func showAlert(title: String?, message: String?, completionHandler: @escaping (alertAction) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            completionHandler(alertAction.OK)
        }
        alertController.addAction(OKAction)
        
        let appDelegate = UIApplication.shared.delegate  as! AppDelegate
        var topViewController = appDelegate.window?.rootViewController
        
        while topViewController?.presentedViewController != nil
        {
            topViewController = topViewController?.presentedViewController
        }
        
        topViewController!.present(alertController, animated: true, completion: nil)
    }
}
