//
//  NFTMetadata.swift
//  NFT Viewer
//
//  Created by Muthu Arumugam on 1/13/22.
//

import Foundation

struct NFTMetadata: Decodable {
    var image: String
    var name: String
    var owner: String
    var symbol: String
    var tokenJson: String
//    var itemID: String

    init() {
        self.name = ""
        self.image = ""
        self.owner = ""
        self.symbol = ""
        self.tokenJson = ""
//        self.itemID = "0"
    }
}
