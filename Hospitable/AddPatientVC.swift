//
//  AddPatientVC.swift
//  Hospitable
//
//  Created by Juheb on 19/01/2018.
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit

class AddPatientVC: UIViewController {
    
    @IBOutlet weak var patientID: UILabel!
    @IBOutlet weak var forename: UITextField!
    @IBOutlet weak var surname: UITextField!
    @IBOutlet weak var issue: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var priority: UITextField!
    @IBOutlet weak var treatment: UITextField!
    
    var alert = alertClass()
    
    func addPatientData(a: String, b: String, c: String, d: Int, e: String, f: Int){
        let randInt = Int(arc4random_uniform(89)+10)
        let tupel = (a,b,c,d,e,f)
        let ID = String(describing: tupel.1 + tupel.0 + String(describing: tupel.3) + (String(describing: randInt)))
        //id created by surname, forename, age, and random integer
        allData[ID] = tupel
        //function that defines how tuples containing patient's data is added to the global array
        sortedIDs.append(ID)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButton(_ sender: Any) {
    //when submit is pressed, data from fields is passed into function that adds it to global variable
        addPatientData(a: forename.text!, b: surname.text!, c: issue.text!, d: Int(age.text!)!, e: treatment.text!, f: Int(priority.text!)!)

        
        present(alert.defaultAlert(alertTitle: "Info", alertMessage: "Submission has been saved"), animated: true, completion: nil)
        patientID.text = ""
        forename.text = ""
        surname.text = ""
        issue.text = ""
        age.text = ""
        priority.text = ""
        treatment.text = ""
        
        //all fields are then cleared and a popup is given to notify the user that the submission was successful
    }
    
}
