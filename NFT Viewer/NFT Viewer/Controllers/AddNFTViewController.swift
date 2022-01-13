//
//  AddNFTViewController.swift
//  NFT Viewer
//
//  Created by Muthu Arumugam on 1/11/22.
//

import UIKit
import Alamofire

class AddNFTViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nftIdText: UITextField!
    @IBOutlet weak var nftItemText: UITextField!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nftIdText.delegate = self;
        nftItemText.delegate = self;
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

    @IBAction func previewClicked(_ sender: Any) {
        // Download asset from the NFT Metadata
        self.previewImage.image = nil; // Clear it
        self.progressBar.setProgress(0.0, animated: true)
        
        getNFTImage(contract: self.nftIdText.text!, tokenId: self.nftItemText.text!)
    }
    
    struct NFTMetadata: Decodable {
      let image: String
        let name: String
        let owner: String
        let symbol: String
        let tokenJson: String
    }
    
    func getNFTImage(contract: String, tokenId: String) {
        let urlPath: String = "https://nft-fetcher-js.herokuapp.com/nft/info?addr=\(contract)&tok=\(tokenId)";
        AF.request(urlPath).responseDecodable(of: NFTMetadata.self) { (response) in
            guard let meta = response.value else {
                let alert = UIAlertController(title: "Error", message: "Decoding Error!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
                     }))
                self.present(alert, animated: true, completion: nil)
                
                print("Error decoding...")
                return
            }
            print(meta.name)
            
            AF.download(meta.image)
                .downloadProgress { progress in
                    let progressString = String(format:"%.2f", progress.fractionCompleted)
                    self.progressBar.setProgress(Float(progressString)!, animated: true)
                }
                .responseData { response in
                    if let data = response.value {
                        let image = UIImage(data: data)
                        self.previewImage.image = image
                    }
                }
        }
    }
}
