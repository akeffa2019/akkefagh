//
//  displeyInfoViewController.swift
//  Akeffa1
//
//  Created by Shaima on 02/07/1440 AH.
//  Copyright © 1440 Morooj. All rights reserved.
//

import UIKit
import Firebase

class displeyInfoViewController: UIViewController {
    
    
    @IBOutlet weak var displeyName: UILabel!
    
    
    @IBOutlet weak var displeyID: UILabel!
    
    @IBOutlet weak var displeyAge: UILabel!
    
    
    @IBOutlet weak var displeySex: UILabel!
    
    var inst: instructor!
   
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
         let ref = Database.database().reference().child(Auth.auth().currentUser!.uid).child("student").child("123")
    
            
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let snapDict = snapshot.value as? NSDictionary
            let name = snapDict?["name"] as? String ?? ""
            let id = snapDict?["id"] as? String ?? ""
            let age = snapDict?["age"] as? String ?? ""
            let gender = snapDict?["gender"] as? String ?? ""
            
            self.displeyID.text = "رقم التعريف : \(id)"
            self.displeyName.text = "الاسم : \(name)"
            self.displeyAge.text = "العمر : \(age)"
            self.displeySex.text = "الجنس : \(gender)"
            
            
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
            
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backItem(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "List")
        self.present(vc!, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
