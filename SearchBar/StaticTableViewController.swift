//
//  StaticTableViewController.swift
//  SearchBar
//
//  Created by Teodik Abrami on 7/21/18.
//  Copyright © 2018 Teodik Abrami. All rights reserved.
//

import UIKit

class StaticTableViewController: UITableViewController, UISearchControllerDelegate, UISearchBarDelegate {

    
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let resultVC = storyboard?.instantiateViewController(withIdentifier: "2") as! TableViewController2
        searchController = UISearchController(searchResultsController: resultVC)
        
        searchController.searchResultsUpdater = resultVC
        
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        
        searchController.dimsBackgroundDuringPresentation = true
        
        self.searchController.hidesNavigationBarDuringPresentation = false
        
        navigationItem.searchController = searchController
        
        self.definesPresentationContext = true
        
    
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
