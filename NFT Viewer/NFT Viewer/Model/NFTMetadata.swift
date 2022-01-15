//
//  NFTMetadata.swift
//  NFT Viewer
//
//  Created by Muthu Arumugam on 1/13/22.
//  This struct decode Json from the server side

import Foundation

struct NFTMetadata: Decodable {
    var image = String()
    var name = String()
    var owner = String()
    var symbol = String()

    var tokenNo = String()
    var contract = String()

    init() {
        self.image = ""
        self.name = ""
        self.owner = ""
        self.symbol = ""

        self.tokenNo = "0"
        self.contract = ""
    }
}
