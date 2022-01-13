//
//  ListNFTTableViewController.swift
//  NFT Viewer
//
//  Created by Muthu Arumugam on 1/13/22.
//

import UIKit

class ListNFTTableViewController: UITableViewController {
    
    var allItems: [NFTMetadata] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allItems.count
    }
    
    // MARK: - Table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "nftItemCell") as? NFTListItemTableViewCell {
            let item: NFTMetadata = allItems[indexPath.row];
            let yourImage: UIImage = UIImage(named: "Logo")!
            cell.nftImage.image = yourImage;
            cell.nameOfNFT.text = item.name;
            cell.nftSymbol.text = item.symbol;
//            cell.nftItemNumber.text = item.itemID;
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135.0;
    }

    @IBAction func addClickedButton(_ sender: Any) {
        self.performSegue(withIdentifier: "addSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewControllerB = segue.destination as? AddNFTViewController {
            viewControllerB.callback = { message in
                //Do what you want in here!
                print(message)
                self.allItems.append(contentsOf: message)
                self.tableView .reloadData()
            }
        }
    }

}
