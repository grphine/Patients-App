//
//  PriorityQueueTVC.swift
//  Hospitable
//
//  Created by Juheb on 22/01/2018.
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit

class PriorityQueueTVC: UITableViewController {

    var priority1 = CircularQueue()
    var priority2 = CircularQueue()
    var priority3 = CircularQueue()
    var priority4 = CircularQueue()
    var priority5 = CircularQueue()
    var priority6 = CircularQueue()
    var priority7 = CircularQueue()
    var priority8 = CircularQueue()
    var priority9 = CircularQueue()
    var priority10 = CircularQueue()
    var totalElements : Int = 0
    var array = [String]()
    
//change implementation to a single linear queue
//segue to new view that allows dequeueing and priority bumping
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        /*
         for value in all data
             if priority == 1:
                 priority1.enqueue(value)
         */
        
        for patient in allData{
            let value = patient.value.priority
            switch value {
            case 10:
                priority10.enQueue(anyItem: patient.key)
                totalElements += 1
            case 9:
                priority9.enQueue(anyItem: patient.key)
                totalElements += 1
            case 8:
                priority8.enQueue(anyItem: patient.key)
                totalElements += 1
            case 7:
                priority7.enQueue(anyItem: patient.key)
                totalElements += 1
            case 6:
                priority6.enQueue(anyItem: patient.key)
                totalElements += 1
            case 5:
                priority5.enQueue(anyItem: patient.key)
                totalElements += 1
            case 4:
                priority4.enQueue(anyItem: patient.key)
                totalElements += 1
            case 3:
                priority3.enQueue(anyItem: patient.key)
                totalElements += 1
            case 2:
                priority2.enQueue(anyItem: patient.key)
                totalElements += 1
            default:
                priority1.enQueue(anyItem: patient.key)
                totalElements += 1
            }
            
        }
        print(array)
        print(totalElements)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Next patient to be seen:"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return totalElements
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celll", for: indexPath) as! CustomCell
        let person = array[indexPath.row]
        let cellDetail = String(describing: allData[person]!.priority)
        print(cellDetail)
        let cellName = ("\(String(describing: allData[person]!.surname)), \(String(describing: allData[person]!.forename))")
        cell.textLabel?.text = cellName
        cell.detailTextLabel?.text = "\(String(describing: allData[person]!.priority))/10"

        return cell
        
       
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
