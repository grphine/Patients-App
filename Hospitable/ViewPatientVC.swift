//
//  ViewPatientVC.swift
//  Hospitable
//
//  Created by Juheb on 19/01/2018.
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit

class ViewPatientVC: UIViewController {

    @IBOutlet weak var patientID: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    @IBOutlet weak var issueField: UITextField!
    @IBOutlet weak var priorityField: UITextField!
    @IBOutlet weak var treatmentField: UITextField!
    @IBOutlet weak var deletebutton: UIButton!
    
    var datacomingin: String!
    var check = 0
    
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
        //load patient data by getting tag from table view
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let patient = allData[datacomingin]
        
        patientID.text = datacomingin
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
    
 
 
    override func setEditing(_ editing: Bool, animated: Bool){
        
        super.setEditing(editing, animated: animated)
        if check % 2 == 0{
            //if check is even, user interaction enabled
            patientID.isUserInteractionEnabled = true
            nameField.isUserInteractionEnabled = true
            ageField.isUserInteractionEnabled = true
            issueField.isUserInteractionEnabled = true
            priorityField.isUserInteractionEnabled = true
            treatmentField.isUserInteractionEnabled = true
        }
        else{
            //user interaction disabled, while data input is then updated
            patientID.isUserInteractionEnabled = false
            nameField.isUserInteractionEnabled = false
            ageField.isUserInteractionEnabled = false
            issueField.isUserInteractionEnabled = false
            priorityField.isUserInteractionEnabled = false
            treatmentField.isUserInteractionEnabled = false
            
            let stringArray = nameField.text!.components(separatedBy: " ")
            let surname = (stringArray[1])
            let forename = (stringArray[0])
            //splits output name (that now may be modifed) into an array, and then puts first item as forename, and second as surname
            
            allData.removeValue(forKey: self.patientID.text!)
            if let index = sortedIDs.index(of: self.patientID.text!) {
                sortedIDs.remove(at: index)
            //deletes current data for appending of new data
            }
            
            addPatientData(a: forename, b: surname, c: issueField.text!, d: Int(ageField.text!)!, e: treatmentField.text!, f: Int(priorityField.text!)!)
            //add "new" data to global data
            let alertController = UIAlertController(title: "Info", message: "Data has been updated", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            //output message informing so
            
        }
        check += 1
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "Warning", message: "Are you sure you want to delete this patient? \n This action is irreversible", preferredStyle: UIAlertControllerStyle.alert)
        //warn user what happens if they press yes
        alertController.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.destructive) {
            UIAlertAction in
           
            //delete record in main array
            allData.removeValue(forKey: self.patientID.text!)
            
            if let index = sortedIDs.index(of: self.patientID.text!) {
                sortedIDs.remove(at: index)
            //remove item from array of IDs, where index is unknown
            }
            
            self.patientID.text = ""
            self.nameField.text = ""
            self.ageField.text = ""
            self.issueField.text = ""
            self.priorityField.text = ""
            self.treatmentField.text = ""
            //clear all fields
            
            self.navigationItem.rightBarButtonItem?.isEnabled = false
            self.deletebutton.isEnabled = false
            //disable buttons so new data cannot be added now the person has been deleted. (It makes no sense to add data to someone that doesn't exist)
        })
        alertController.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
  

    }
    
}
