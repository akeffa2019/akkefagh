//
//  AudioBriefDes.swift
//  Akeffa1
//
//  Created by Morooj on 11/06/1440 AH.
//  Copyright © 1440 Morooj. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase
import AVKit
import AVFoundation

struct AudioURL{
    var urlString = ""
    var url2String = ""
    var url3String = ""
    var url4String = ""
    var url5String = ""
    var url6String = ""
    var url7String = ""
}

class AudioBriefDes: UIViewController {
    @IBOutlet var wa: UIButton!
    var i = 0
    var audioPlayer = AVAudioPlayer()
    var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
//              checkingResult(audio: URL(fileURLWithPath: Bundle.main.path(forResource: "whatApp1", ofType: "mp3")!))
        //        let db = Firestore.firestore()
        //        db.collection("Brief Description").getDocuments()
        //            {
        //                (querySnapshot, err) in
        //
        //                if let err = err
        //                {
        //                    print("Error getting documents: \(err)");
        //                }
        //                else{
        //                    for document in querySnapshot!.documents {
        //                        if document.documentID == "whatApp" {
        //                            let audioURLStrnig = document.data()["audio"] as! String
        //                            self.audioURLgObject.urlString = audioURLStrnig
        //                        }
        //
        //                        if document.documentID == "whatTalaSystem" {
        //                            let audioURLStrnig = document.data()["audio"] as! String
        //                            self.audioURLgObject.url2String = audioURLStrnig
        //                        }
        //
        //                        if document.documentID == "AppGoal" {
        //                            let audioURLStrnig = document.data()["audio"] as! String
        //                            self.audioURLgObject.url3String = audioURLStrnig
        //                        }
        //
        //                        if document.documentID == "AppContent" {
        //                            let audioURLStrnig = document.data()["audio"] as! String
        //                            self.audioURLgObject.url4String = audioURLStrnig
        //                        }
        //
        //                        if document.documentID == "keyboard" {
        //                            let audioURLStrnig = document.data()["audio"] as! String
        //                            self.audioURLgObject.url5String = audioURLStrnig
        //                        }
        //
        //                        if document.documentID == "lesson" {
        //                            let audioURLStrnig = document.data()["audio"] as! String
        //                            self.audioURLgObject.url6String = audioURLStrnig
        //                        }
        //
        //                        if document.documentID == "test" {
        //                            let audioURLStrnig = document.data()["audio"] as! String
        //                            self.audioURLgObject.url7String = audioURLStrnig
        //                        }
        //
        //                    }
        //
        //
        //
        //                }// else
        //        }
        
    } // load
    
    @IBAction func `return`(_ sender: Any) {
  
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
        self.present(vc!, animated: true, completion: nil)
        if i == 1 {audioPlayer.stop()}
    }
    
    @IBAction func whatApp(_ sender: Any) {
        i = 0
         checkingResult(audio: URL(fileURLWithPath: Bundle.main.path(forResource: "whatApp1", ofType: "mp3")!))
        i = i+1
    }
    
    @IBAction func whatTala(_ sender: Any) {
        i = 0
        checkingResult(audio: URL(fileURLWithPath: Bundle.main.path(forResource: "whatTala1", ofType: "mp3")!))
         i = i+1
        //        let url = URL(string:self.audioURLgObject.url2String )
        //        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        //        self.player = AVPlayer(playerItem: playerItem)
        //        player!.play()
    }
    
    @IBAction func AppGoal(_ sender: Any) {
        i = 0
        
        checkingResult(audio: URL(fileURLWithPath: Bundle.main.path(forResource: "appGoal", ofType: "mp3")!))
         i = i+1
        //        let url = URL(string:self.audioURLgObject.url3String )
        //        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        //        self.player = AVPlayer(playerItem: playerItem)
        //        player!.play()
    }
    
    @IBAction func AppContent(_ sender: Any) {
        i = 0
        checkingResult(audio: URL(fileURLWithPath: Bundle.main.path(forResource: "appContent1", ofType: "mp3")!))
         i = i+1
        //        let url = URL(string:self.audioURLgObject.url4String)
        //        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        //        self.player = AVPlayer(playerItem: playerItem)
        //        player!.play()
    }
    
    @IBAction func Keyboard(_ sender: Any) {
        i = 0
        checkingResult(audio: URL(fileURLWithPath: Bundle.main.path(forResource: "keyboard1", ofType: "mp3")!))
         i = i+1
        //        let url = URL(string:self.audioURLgObject.url5String )
        //        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        //        self.player = AVPlayer(playerItem: playerItem)
        //        player!.play()
    }
    @IBAction func lesson(_ sender: Any) {
        i = 0
        checkingResult(audio: URL(fileURLWithPath: Bundle.main.path(forResource: "lesson1", ofType: "mp3")!))
         i = i+1
        //        let url = URL(string:self.audioURLgObject.url6String )
        //        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        //        self.player = AVPlayer(playerItem: playerItem)
        //        player!.play()
    }
    @IBAction func Test(_ sender: Any) {
        i = 0
        checkingResult(audio: URL(fileURLWithPath: Bundle.main.path(forResource: "test1", ofType: "mp3")!))
         i = i+1
        //        let url = URL(string:self.audioURLgObject.url7String )
        //        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        //        self.player = AVPlayer(playerItem: playerItem)
        //        player!.play()
    }
    
    func checkingResult(audio: URL){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audio)
            audioPlayer.play()
        } catch {
            print(error)
        }
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
}//end class
