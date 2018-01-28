//
//  PriorityQueueTVC.swift
//  Hospitable
//
//  Created by Juheb on 22/01/2018.
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit

class PriorityQueueTVC: UITableViewController {

    var q = Queue(lengthOfQueue: 20)
    var array = [String]()
    var tag : String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = []
        
        for item in allData{
            q.addItemToQueue(itemToAdd: dataItem.init(name: item.key, priority: item.value.priority))
        }
        //adds all patients to the queue, by getting their key in the dictionary, and their priority in the value
        
        for item in q.queue{
            array.append(item.name)
        }
        //creates an array of the names in order they appear in the queue
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
     
        self.tableView.reloadData()
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
        return (q.rear - q.front)
        //above is the length of the queue
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celll", for: indexPath) as! CustomCell
        let person = array[indexPath.row]
        cell.textLabel?.text = ("\(String(describing: allData[person]!.surname)), \(String(describing: allData[person]!.forename))")
        cell.detailTextLabel?.text = "\(String(describing: allData[person]!.priority))/10"

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tag = array[indexPath.row]
        performSegue(withIdentifier: "PriorityViewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let toSend = segue.destination as! ViewPriorityPatient
        toSend.datacomingin1 = tag
    }
    
    //----------------------
    //Below, the code allowing for a delete button

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            allData.removeValue(forKey: array[indexPath.row])
            array.remove(at: indexPath.row)
            q.dequeItem()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
            //when patient is dequeued, their records are deleted so they will not appear in any other views
            
            
        }
//           else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
    }
    

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
