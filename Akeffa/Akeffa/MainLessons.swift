//
//  MainLessons.swift
//  Akeffa
//
//  Created by Bashayr Hindi on 04/02/2019.
//  Copyright © 2019 Bashayr Hindi. All rights reserved.
//

import UIKit
import FirebaseFirestore


class MainLessons: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    
    
    var mainCells = ["الحروف ١","الحروف ٢","التشكيل","لوحة المفاتيح"]
    var myIndex = 0
    @IBOutlet weak var mainList: UITableView!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainCell = mainList.dequeueReusableCell(withIdentifier: "mainCell")
        
        mainCell?.textLabel?.text = mainCells[indexPath.row]
        
        return mainCell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        performSegue(withIdentifier: "mainLessonSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let svc = segue.destination as! SubLettersLessons
        svc.myString = mainCells[myIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainList.delegate = self
        mainList.dataSource = self
    }
    
    @IBAction func back(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
