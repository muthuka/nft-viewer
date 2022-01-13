//
//  AddNFTViewController.swift
//  NFT Viewer
//
//  Created by Muthu Arumugam on 1/11/22.
//

import UIKit
import Alamofire

class AddNFTViewController: UIViewController, UITextFieldDelegate {

    // All connections from the view
    @IBOutlet weak var nftIdText: UITextField!
    @IBOutlet weak var nftItemText: UITextField!
    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // To return values
    var callback : (([NFTMetadata]) -> Void)?
    var loadedNFTJson: [NFTMetadata] = []
    
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

    @IBAction func saveClicked(_ sender: Any) {
        print("Sending values back....")
        callback?(loadedNFTJson)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func previewClicked(_ sender: Any) {
        // Download asset from the NFT Metadata
        self.previewImage.image = nil; // Clear it
        self.progressBar.setProgress(0.0, animated: true)
        
        // Keyboard clear
        self.nftItemText.resignFirstResponder()
        self.nftIdText.resignFirstResponder()
        
        // Return value reset
        self.loadedNFTJson = []
        
        getNFTImage(contract: self.nftIdText.text!, tokenId: self.nftItemText.text!)
    }
    
    func getNFTImage(contract: String, tokenId: String) {
        let urlPath: String = "https://nft-fetcher-js.herokuapp.com/nft/info?addr=\(contract)&tok=\(tokenId)";
        print("Start downloading \(urlPath)")
        AF.request(urlPath).responseDecodable(of: NFTMetadata.self) { (response) in
            guard let meta = response.value else {
                let alert = UIAlertController(title: "Error", message: "Decoding Error!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (_) in
                     }))
                self.present(alert, animated: true, completion: nil)
                
                print("Error decoding...")
                return
            }
            
            self.loadedNFTJson = [meta]
//            self.loadedNFTJson[0].itemID = self.nftItemText.text!
            print("Got data \(meta.image)")
            
            AF.download(meta.image)
                .downloadProgress { progress in
                    let progressString = String(format:"%.2f", progress.fractionCompleted)
                    self.progressBar.setProgress(Float(progressString)!, animated: true)
                    print("Progress: \(progressString)")
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
