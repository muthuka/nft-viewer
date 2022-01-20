//
//  SettingsTableViewController.swift
//  NFT Viewer
//
//  Created by Muthu Arumugam on 1/15/22.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let section1titles = ["Ropsten", "Kovan", "Mainnet"];
    let userDefault = UserDefaults.standard;
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checkedCell", for: indexPath)
        
        let networkSettings = userDefault.string(forKey: "network");
        cell.textLabel?.text = section1titles[indexPath.row]
        
        if (section1titles[indexPath.row].lowercased() == networkSettings) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userDefault.set(section1titles[indexPath.row].lowercased(), forKey: "network")
        self.tableView.reloadData()
    }

}
