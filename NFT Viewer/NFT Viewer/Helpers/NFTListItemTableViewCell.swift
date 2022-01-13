//
//  TableViewCell.swift
//  NFT Viewer
//
//  Created by Muthu Arumugam on 1/13/22.
//

import UIKit

class NFTListItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nftImage: UIImageView!
    @IBOutlet weak var nameOfNFT: UILabel!
    @IBOutlet weak var nftSymbol: UILabel!
    @IBOutlet weak var nftItemNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
