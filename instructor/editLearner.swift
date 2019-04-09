//
//  learnerViewController.swift
//  instructorPart
//
//  Created by Shaima on 27/06/1440 AH.
//  Copyright © 1440 Shaima. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class editLearner: UIViewController {
    
    @IBOutlet weak var id: UITextField!
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var age: UITextField!
    
    var gender: String!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
         self.hideKeyboardWhenTappedAround()
        
    }
    
    
    @IBAction func addStudent(_ sender: Any) {
        let name = self.name.text!
         let id = self.id.text!
         let age = self.age.text!
        
       
        
        if name != "" && id != "" && age != "" && self.gender != ""  {
            
            let stu = learnerClass(name: name,id: id, age: age, gender: self.gender)
            
            let ref = Database.database().reference().child(Auth.auth().currentUser!.uid).child("student")
            
            let Ref = ref.child("123")
            // هنا المفروض نحط الاي دي حق الليرنر او اسمه
            Ref.setValue(stu.toAnyObject())
            Ref.setValue(stu.dictionary)
            
            let alertController = UIAlertController(title: "تم إضافة الطالب بنجاح", message: "", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK",
                                              style: .default) { _ in
                                                let vc = self.storyboard?.instantiateViewController(withIdentifier: "List")
                                                self.present(vc!, animated: true, completion: nil)
            }
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
            
       
           
           

            
        }
        
        else {
            
            let alertController = UIAlertController(title: "Embty", message: "Please write all faild text!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        
        
       
        
        
        
    }
    
    
    @IBAction func updateInfo(_ sender: Any) {
        
        let name = self.name.text!
        let id = self.id.text!
        let age = self.age.text!
        
       
        let ref = Database.database().reference().child(Auth.auth().currentUser!.uid).child("student").child("123")
      
        
        if name != "" {
            let valuesName = ["name": self.name.text]
            ref.updateChildValues(valuesName as [AnyHashable : Any])
            
            Alrate ()
        
        }
            
        if age != "" {
            
            let valuesAge = ["age": self.age.text]
            ref.updateChildValues(valuesAge as [AnyHashable : Any])
            
            Alrate ()
            
        }
            
         if id != "" {
            
           
            let valuesID = ["id": self.id.text]
            ref.updateChildValues(valuesID as [AnyHashable : Any])
            
            Alrate ()
           
        }
        
        if let vGender = self.gender {
            let valuesGender = ["gender": vGender]
            ref.updateChildValues(valuesGender as [AnyHashable : Any])
            
            Alrate ()
        }
        
        
        if name == "" && id == "" && age == "" {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LearnerInfo")
            self.present(vc!, animated: true, completion: nil)
           
        }
        
        
        
    }
    
    
    @IBAction func sex(_ sender: DLRadioButton) {
        if sender.tag == 1 {
            print("Female")
            self.gender = "Female"
        }
        else if sender.tag == 2 {
            print("Male")
            self.gender = "Male"
        }
    }
    
    
    
    @IBAction func backItem(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LearnerInfo")
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func backItem2(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "List")
        self.present(vc!, animated: true, completion: nil)
    }
        
    
    func Alrate () {
        let alertController = UIAlertController(title: "تم تغيير البيانات بنجاح", message: "", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK",
                                          style: .default) { _ in
                                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LearnerInfo")
                                            self.present(vc!, animated: true, completion: nil)
        }
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        
    }

}
