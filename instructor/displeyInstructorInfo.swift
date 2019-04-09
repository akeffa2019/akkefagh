//
//  displeyInstructorInfo.swift
//  Akeffa1
//
//  Created by Shaima on 04/07/1440 AH.
//  Copyright © 1440 Morooj. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class displeyInstructorInfo: UIViewController {
    
    
    @IBOutlet weak var displeyName: UILabel!
    
    @IBOutlet weak var displeyEmail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let uid = Auth.auth().currentUser!.uid
        
        let refInst = Database.database().reference().child(uid)
        
        refInst.observeSingleEvent(of: .value, with: { (snapshot) in
            let snapDict = snapshot.value as? NSDictionary
            let name = snapDict?["name"] as? String ?? ""
            let email = snapDict?["email"] as? String ?? ""
            self.displeyName.text = " الاسم : \(name)"
            self.displeyEmail.text = "البريد الالكتروني : \(email)"
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    
    @IBAction func backItem(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Main")
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
