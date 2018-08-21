//
//  TableViewController.swift
//  SearchBar
//
//  Created by Teodik Abrami on 7/18/18.
//  Copyright © 2018 Teodik Abrami. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UISearchResultsUpdating,UISearchBarDelegate{
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let cgPoint = sender.convert(CGPoint.zero, to: tableView)
        let indexPath = tableView.indexPathForRow(at: cgPoint)
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "5") as! ShowViewController
        if filtered.count != 0 {
           resultVC.name = filtered[(indexPath?.row)!]
        } else {
              resultVC.name = countries[(indexPath?.row)!]
        }
        self.searchController?.isActive = false //????? chera bayad hatman bashe
        //performSegue(withIdentifier: "1s", sender: nil)
        present(resultVC, animated: true, completion: nil)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, !text.isEmpty {
            self.filtered = self.countries.filter({ (country) -> Bool in
                
                return country.lowercased().contains(text.lowercased())
            })
        } else {
            self.filtered = [String]() // String() Int()
        }
        self.tableView.reloadData()
    }
    
    var searchController: UISearchController?
    var filtered = [String]()
    
    lazy var countries: [String] = {
        var names = [String]()
        let current = NSLocale(localeIdentifier: "en_US")
        for code in NSLocale.isoCountryCodes {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = current.displayName(forKey: NSLocale.Key.identifier, value: id)
            if let country = name {
                names.append(country)
            }
        }
        return names
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchBar.delegate = self
        searchController?.dimsBackgroundDuringPresentation = false
        searchController?.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController?.searchBar.setValue("enseraf", forKey: "_cancelButtonText")
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "کالای خود را جستجو کنید ...", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController!.isActive {
            return filtered.count
        }
        return countries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = (searchController!.isActive) ? filtered[indexPath.row] : countries[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
