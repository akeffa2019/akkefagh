//
//  SubLessons.swift
//  Akeffa
//
//  Created by Bashayr Hindi on 04/02/2019.
//  Copyright © 2019 Bashayr Hindi. All rights reserved.
//

import UIKit
import FirebaseFirestore

class SubLettersLessons: UIViewController , UITableViewDataSource , UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var lessons1 = [[String:String]]()
    var lessons2 = [[String:String]]()
    var lessons3 = [[String:String]]()
    
    var lesson = [String:String]()
    
    var myString = String()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //     return lessons1.count
        if section == 0 {
            return lessons1.count }
        if section == 1 {
            return lessons2.count }
        if section == 2 {
            return lessons3.count }
            
        else { return 1}
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "المجموعة الأولى" }
        if section == 1 {
            return "المجموعة الثانية" }
        if section == 2 {
            return "المجموعة الثالثة" }
            
        else { return ""}
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mainCell = tableView.dequeueReusableCell(withIdentifier: "cell", for : indexPath)
        if indexPath.section == 0 {
            mainCell.textLabel?.text = lessons1[indexPath.row]["title"]
            return mainCell
            
        }
        
        if indexPath.section == 1 {
            mainCell.textLabel?.text = lessons2[indexPath.row]["title"]
            return mainCell
            
        }
        
        if indexPath.section == 2 {
            mainCell.textLabel?.text = lessons3[indexPath.row]["title"]
            return mainCell
            
        }
            
        else {
            let mainCell = UITableViewCell()
            return mainCell}
    }
    
    
    override func viewDidLoad() {
        let sec = myString
        self.tableView.dataSource = self
        self.tableView.delegate = self
        super.viewDidLoad()
        if myString == "الحروف ١"{
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
                        
                        let k = document.documentID
                        let v = document.data()["group"] as! String
                        self.lesson["title"]=k
                        self.lesson["group"]=v
                        if  self.lesson["group"]=="group1"
                        { self.lessons1.append(self.lesson)}
                        else if  self.lesson["group"]=="group2"
                        { self.lessons2.append(self.lesson)}
                        else if  self.lesson["group"]=="group3"
                        { self.lessons3.append(self.lesson)}
                    }
                    self.tableView.reloadData()
                    
                }
            }}
        
       if myString == "الحروف ٢"{
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

                            let k = document.documentID
                            let v = document.data()["SecondGroup"] as! String
                            self.lesson["title"]=k
                            self.lesson["SecondGroup"]=v
                            if  self.lesson["SecondGroup"]=="group1"
                            { self.lessons1.append(self.lesson)}
                            else if  self.lesson["SecondGroup"]=="group2"
                            { self.lessons2.append(self.lesson)}
                            else if  self.lesson["SecondGroup"]=="group3"
                            { self.lessons3.append(self.lesson)}
                        }
                        self.tableView.reloadData()

                    }
            }}

    }
    var r = 0
    var s = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        r = indexPath.row
        s = indexPath.section
        performSegue(withIdentifier: "subLessonSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let svc = segue.destination as! Lesson
        svc.selectedSection = self.myString
        if s == 0 {
            svc.selectedLesson = lessons1[r]["title"]!
        }
        if s == 1 {
            svc.selectedLesson = lessons2[r]["title"]!
        }
        if s == 2 {
            svc.selectedLesson = lessons3[r]["title"]!
        }
        
    }
    
    @IBAction func back(_ sender: Any) {
         presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
}



//            if IndexPath.row == 0 {
//
//                svc.myString = lessons1[indexPath.row]["title"]
//            }

//            if indexPath.row == 1 {
//                svc.myString = lessons2[indexPath.row]["title"]
//            }
//
//            if indexPath.row == 2 {
//                svc.myString = lessons3[indexPath.row]["title"]
//
//            }





//     func back(_ sender: Any) {
//        presentingViewController?.dismiss(animated: true, completion: nil)
//    }


//
//
//    var sections = [
//        section(group:"المجموعة الأولى",
//                letterOne: [],           // [0]
//            expanded: false),
//        //////////////////////////////////////////
//        section(group: "المجموعة الثانية",
//                letterOne: [],            // [1]
//            expanded: false),
//        ////////////////////////////////////////////
//        section(group: "المجموعة الثالثة",
//                letterOne: [],              // [2]
//            expanded: false)
//    ]
//
//
//    let groups = [String]()
//    var mainCells = [String]()
//
//    var myString = String()
//
//    var myIndex1 = 0
//    var myIndex2 = 0
//
//    private let headerIdentifier = "headerCell"
//    private let cellIdentifier = "contentCell"
//

//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sections.count
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return sections[section].letterOne.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 44
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if (sections[indexPath.section].expanded) {
//            return 44
//        } else {
//            return 0
//        }
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = ExpandableHeaderView()
//
//        header.customInit(title: sections[section].group, section: section, delegate: self)
//
//        return header
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = list.dequeueReusableCell(withIdentifier: "labelCell")!
//        cell.textLabel?.text = sections[indexPath.section].letterOne[indexPath.row]
//        return cell
//    }
//
//    func toggleSection(header: ExpandableHeaderView, section: Int) {
//        sections[section].expanded = !sections[section].expanded
//        myIndex2 = section
//
//        list.beginUpdates()
//        for i in 0 ..< sections[section].letterOne.count {
//            list.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
//        }
//        list.endUpdates()
//
//
//    }
//
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        myIndex1 = indexPath.row
//        performSegue(withIdentifier: "subLessonSegue", sender: self)
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let svc = segue.destination as! Lesson
//        svc.myString = self.sections[myIndex2].letterOne[myIndex1]
//
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        list.delegate = self
//        list.dataSource = self
//
//        self.checkInput(path:sections[0].group!,num:0)
//        self.checkInput(path:sections[1].group!,num:1)
//        self.checkInput(path:sections[2].group!,num:2)
//    }
//
//    func checkInput(path: String , num:Int) {
//
//        let db = Firestore.firestore()
//
//        db.collection(myString).whereField("group", isEqualTo: path).getDocuments()
//            {
//                (querySnapshot, err) in
//
//                if let err = err
//                {
//                    print("Error getting documents: \(err)");
//                }
//                else
//                {
//                    for document in querySnapshot!.documents {
//                        //   self.mainCells.append(document.documentID)
//                        self.sections[num].letterOne.append(document.documentID)
//                    }
//
//                    self.list.reloadData()
//                }
//
//        }
//
//    }


