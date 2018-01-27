//
//  TableViewController.swift
//  Hospitable
//
//  Created by Juheb on 20/01/2018.
//  Copyright © 2018 Juheb. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {

    var tag = ""
    var filteredPatients: [String]?
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidLoad() {
        filteredPatients = sortedIDs
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        //defines the search bar's actions
        super.viewDidLoad()
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
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.dismiss(animated: false, completion: nil)
    }
 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let patients = filteredPatients else {
            return 0
        }
        return patients.count
        //displays as many patients as there are in filteredPatients
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        if let patients = filteredPatients?.sorted() {
            let person = patients[indexPath.row]
            let cellName = ("\(String(describing: allData[person]!.surname)), \(String(describing: allData[person]!.forename))")
            cell.textLabel?.text = cellName
            //generates cell names from patient's names
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredPatients = sortedIDs.filter { individual in
                return individual.lowercased().contains(searchText.lowercased())
                //puts everything in same case for effective searching
            }
            
        } else {
            filteredPatients = sortedIDs
            //since the tableview only displayed what has been searched (filtered), if there are no searches, filtered = all
        }
        tableView.reloadData()
        //reloads tableview with new data given by searching
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Patients"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sortedIDs = sortedIDs.sorted()
        let toFind = filteredPatients![indexPath.row]
        tag = sortedIDs[sortedIDs.index(of: toFind)!]
        self.performSegue(withIdentifier: "TableViewSegue", sender: nil)
        //first gets patient name from filtered by the row the user selected
        //then tag is the name from the global names with the index of the name that was selected
    }
    
    override func viewWillAppear(_ animated: Bool) {
        filteredPatients = sortedIDs.sorted()
        super.viewWillAppear(true)
        self.tableView.reloadData()
        //after a patient is deleted (global), filteredPatients (local) needs to be updated from sortedIDs (global)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let toSend = segue.destination as! ViewPatientVC
        toSend.datacomingin = tag
    }


}





//integrate search function as is demonstrated in app to the left





