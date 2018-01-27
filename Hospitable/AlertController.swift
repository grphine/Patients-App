//
//  AlertController.swift
//  Tracker v.2
//
//  Created by Juheb on 02/12/2017.
//  Copyright © 2017 Juheb. All rights reserved.
//

import Foundation
import UIKit

class alertClass: UIAlertController {
    
    let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
    var count: Int = 0
    
    
    func defaultAlert(alertTitle: String, alertMessage:String) -> UIAlertController {
        alertController.title = alertTitle
        alertController.message = alertMessage
        //Sets the alert title and message as the parameters passed into the function
        
        if count < 1 {
            alertController.addAction(defaultAction)
            count += 1
        //Ensures the dismiss button is only added to the alert once, and not every time this function is called
        }
        return alertController
    }
    
    
    
    
    
    
}
