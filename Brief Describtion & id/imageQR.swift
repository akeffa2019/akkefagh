//
//  SecondViewController.swift
//  anmsIRAQ
//
//  Created by Mashael Khalid on 19/05/1440 AH.
//  Copyright © 1440 Mashael Khalid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
class imageQR: UIViewController {

    var id = ""
    @IBOutlet weak var displeyLable: UILabel!
    @IBOutlet weak var imgeview: UIImageView!
    
    override func viewDidLoad() {
       
                let userID = ID().id
                self.displeyLable.text = userID
                let image = self.generateQRCode(from: userID)
                self.imgeview.image=image
                super.viewDidLoad()
        
    }
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        return nil
    }//generateQRCode
    
    @IBAction func `return`(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: true, completion: nil)
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var keyCommands: [UIKeyCommand]? {
        
        let commands = [
            UIKeyCommand(input: UIKeyCommand.inputRightArrow, modifierFlags: [], action: #selector(First.enabelMoving(command:))),
            UIKeyCommand(input: UIKeyCommand.inputLeftArrow, modifierFlags: [], action: #selector(First.enabelMoving(command:))),
            UIKeyCommand(input: UIKeyCommand.inputDownArrow, modifierFlags: [], action: #selector(First.enabelMoving(command:))),
            UIKeyCommand(input: UIKeyCommand.inputUpArrow, modifierFlags: [], action: #selector(First.enabelMoving(command:)))
        ]
        
        return commands
        
    }
}// class
