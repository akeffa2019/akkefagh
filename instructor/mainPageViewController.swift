//
//  mainPageViewController.swift
//  instructorPart
//
//  Created by Shaima on 15/06/1440 AH.
//  Copyright © 1440 Shaima. All rights reserved.
//

import UIKit
import FirebaseAuth
import MessageUI

class mainPageViewController: UIViewController, MFMailComposeViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signoutAction(_ sender: Any) {
        let alert = UIAlertController(title: "تسجيل خروج",
                                      message: "هل انت متأكد من تسجيل الخروج؟",
                                      preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "نعم",
                                       style: .default) { _ in
                                        let firebaseAuth = Auth.auth()
                                        do {
                                            try firebaseAuth.signOut()
                                            print("sign out successfully")
                                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Akeffa")
                                            self.present(vc!, animated: true, completion: nil)
                                        } catch let signOutError as NSError {
                                            print ("Error signing out: %@", signOutError)
                                        }
        }
        
        let cancelAction = UIAlertAction(title: "إلغاء",
                                         style: .cancel)
        
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    
        
    }
    
    
    
    @IBAction func sendEmail(_ sender: Any) {
        
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["sheem.apps@gmail.com"])
        mailComposerVC.setSubject("Sending you an in-app e-mail...")
        mailComposerVC.setMessageBody("Sending e-mail in-app is not so bad!", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        
        let alertController = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: MFMailComposeViewControllerDelegate Method
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    

    
}
