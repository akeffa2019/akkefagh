//
//  Lesson.swift
//  Akeffa
//
//  Created by Bashayr Hindi on 04/02/2019.
//  Copyright © 2019 Bashayr Hindi. All rights reserved.
//

import UIKit
import AVFoundation
import FirebaseFirestore
import Foundation
import Firebase
import AVKit

struct AudioURLString {
    var urlString = ""
}
class Lesson: UIViewController , UITextFieldDelegate {
   
    // content of the interface
    
    var selectedLesson = String()
    var selectedSection = String()
    
    var keyBoardMap = [String : String]()
    var letter = ""
    
    @IBOutlet weak var practiceTextField: UITextField!
    
    @IBOutlet weak var explaination: UILabel!
    
    @IBOutlet weak var lessonName: UILabel!
    
    @IBOutlet weak var nextLesson: UIButton!
    @IBOutlet weak var previousLesson: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lessonName.text = selectedLesson
        
        if lessonName.text == "حرف الألِف"{
            self.previousLesson.isHidden = true
        }
        self.practiceTextField.placeholder = "إبحَثْ عن \(lessonName.text!) في لوحةِ المفاتيح"
       
        readFromDatabase()
    }

    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "les", sender: self)
        
    }
    
    //////////////////////////////////
 
    //Audio
    var audioURLStringObject = AudioURLString()
    let correct = URL(fileURLWithPath: Bundle.main.path(forResource: "Good Job!", ofType: "mp3")!)
    let wrong = URL(fileURLWithPath: Bundle.main.path(forResource: "incorrect sound effect", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    var player: AVPlayer?
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBAction func playRemoteFile(sender: UIButton) {
        
        let url = URL(string:self.audioURLStringObject.urlString )
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        self.player = AVPlayer(playerItem: playerItem)
        
        player!.play()
    }
    ////////////////////////////////////////////////////////////////

    
    //retriving data from database
    func readFromDatabase (){
        let db = Firestore.firestore()
        db.collection("الحروف").getDocuments()
            {
                (querySnapshot, err) in
                
                if let err = err
                {
                    print("Error getting documents: \(err)");
                }
                else
                {
                    for document in querySnapshot!.documents {
                        if document.documentID == "حرف الألِف" {
                            let audioURLStrnig = document.data()["audio"] as! String
                            self.audioURLStringObject.urlString = audioURLStrnig
                        }
                        if self.lessonName.text == document.documentID{
                            self.letter = document.data()["value"] as! String
                            self.explaination.text = document.data()["explain"] as? String
                        }
                        let key = document.data()["key"] as! String
                        let value = document.data()["value"] as! String
                        self.keyBoardMap[key] = value
                    }
                }
        }
    }
    
    ///////////////////////////////////////////
   
    
    //answer checking and result
    @IBAction func checkAnswer(_ tx: UITextField) {
        
        if tx.text == "" {
            tx.text = ""
        }
        else{
            tx.text = self.keyBoardMap[String(tx.text!.last!)]
        
            if letter == tx.text{
                checkingResult(tx: tx , result: correct)
            }
            else{
                checkingResult(tx: tx , result: wrong)
            }
        }
    }

    func checkingResult(tx: UITextField , result: URL){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: result)
            audioPlayer.play()
        } catch {
            print(error)
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
                print(self.selectedLesson)
                switch(self.selectedLesson) {
                case "حرف الألِف":
                    self.selectedLesson = "حرف الباء"
                    break
                case "حرف الباء":
                    self.selectedLesson = "حرف التاء"
                    break
                case "حرف التاء":
                   self.selectedLesson = "حرف الثاء"
                    break
                case "حرف الثاء":
                    self.selectedLesson = "حرف الجيم"
                    break
                case "حرف الجيم":
                    self.selectedLesson = "حرف الحاء"
                    break
                case "حرف الحاء":
                   self.selectedLesson = "حرف الخاء"
                    break
                case "حرف الخاء":
                    self.selectedLesson = "حرف الدال"
                    break
                case "حرف الدال":
                    self.selectedLesson = "حرف الذال"
                    break
                case "حرف الذال":
                    self.selectedLesson = "حرف الراء"
                    break
                case "حرف الراء":
                    self.selectedLesson = "حرف الزاي"
                    break
                default:
                    break
                }
        
                    performSegue(withIdentifier: "next", sender: self)
    }
    
    
    @IBAction func previousButton(_ sender: Any) {
        print("1-\(self.selectedLesson)")

        switch(self.selectedLesson) {

        case "حرف الباء":
            self.selectedLesson = "حرف الألِف"
            print("2-\(self.selectedLesson)")

            break
            
        case "حرف التاء":
            self.selectedLesson = "حرف الباء"
            break
            
        case "حرف الثاء":
            self.selectedLesson = "حرف التاء"
            break
            
        case "حرف الجيم":
            self.selectedLesson = "حرف الثاء"
            break
        case "حرف الحاء":
            self.selectedLesson = "حرف الجيم"
            break
        case "حرف الخاء":
            self.selectedLesson = "حرف الحاء"
            break
        case "حرف الدال":
            self.selectedLesson = "حرف الخاء"
            break
        case "حرف الذال":
            self.selectedLesson = "حرف الدال"
            break
        case "حرف الراء":
            self.selectedLesson = "حرف الذال"
            break
        case "حرف الزاي":
            self.selectedLesson = "حرف الراء"
            break

        default:
            break
        }
        performSegue(withIdentifier: "previous", sender: self)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let svc = segue.destination as! Lesson
            svc.selectedLesson = self.selectedLesson
            svc.selectedSection = self.selectedSection
        }
        else if segue.identifier == "previous"{
          
            let svc = segue.destination as! Lesson
            svc.selectedLesson = self.selectedLesson
            print("3-\(self.selectedLesson)")
            print("4-\(svc.selectedLesson)")

            svc.selectedSection = self.selectedSection
        }
       else if segue.identifier == "les"{
            let svc = segue.destination as! SubLettersLessons
            svc.myString = selectedSection}
    }
    

}
