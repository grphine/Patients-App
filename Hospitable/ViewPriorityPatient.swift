///
//  ViewPatientVC.swift
//  Hospitable
//
//  Created by Juheb on 19/01/2018.
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit

class ViewPriorityPatient: UIViewController {
    
    @IBOutlet weak var patientID: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var issueField: UITextField!
    @IBOutlet weak var priorityField: UITextField!
    @IBOutlet weak var treatmentField: UITextField!
    
    
    var datacomingin1: String!
    var check = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load patient data by getting tag from table view
        
        let patient = allData[datacomingin1]
        
        patientID.text = datacomingin1
        nameField.text = String("\(String(describing: patient!.forename)) \(String(describing: patient!.surname))")
        ageField.text = String(describing: patient!.age)
        issueField.text = patient!.issue
        treatmentField.text = patient!.medication
        priorityField.text = String(describing: patient!.priority)
        //grabs patient's data and pastes it into text fields
        patientID.isUserInteractionEnabled = false
        nameField.isUserInteractionEnabled = false
        ageField.isUserInteractionEnabled = false
        issueField.isUserInteractionEnabled = false
        priorityField.isUserInteractionEnabled = false
        treatmentField.isUserInteractionEnabled = false
        //disables interaction with text fields
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
}
