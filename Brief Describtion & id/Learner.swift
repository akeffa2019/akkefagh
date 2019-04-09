//
//  Learner.swift
//  Akeffa1
//
//  Created by Morooj on 11/06/1440 AH.
//  Copyright © 1440 Morooj. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

struct ID {
//    var id = Auth.auth().currentUser!.uid
    var id = Auth.auth().currentUser!.uid
}
class Learner: UIViewController {
    var finalize = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        readFromDatabase ()
        let userID = ID().id
        print("user ID --coool--->  \(userID)")
        // Do any additional setup after loading the view.
    }
    
    func readFromDatabase (){
        let db = Firestore.firestore().collection("Students").document(ID().id)
        
        db.getDocument { (document, error) in
            if let document = document, document.exists {
            } else {
                db.setData(["letterTest":[]])
            }
        }
    }
    
    
    @IBAction func BriefDesButton(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "brief")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func `return`(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Akeffa")
        self.present(vc!, animated: true, completion: nil)
    }

    @IBAction func IDAnanymouse(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "imgeQR")
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func StartTest(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainTest")
    self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBAction func StartLesson(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainLesson")
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
}
