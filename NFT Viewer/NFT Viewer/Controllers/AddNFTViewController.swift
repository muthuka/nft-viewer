//
//  AddNFTViewController.swift
//  NFT Viewer
//
//  Created by Muthu Arumugam on 1/11/22.
//

import UIKit

class AddNFTViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nftIdText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nftIdText.delegate = self;
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

}
