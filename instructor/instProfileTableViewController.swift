//
//  instProfileTableViewController.swift
//  
//
//  Created by Shaima on 27/06/1440 AH.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class instProfileTableViewController: UITableViewController {
    

    

    

    let listToUsers = "ListToUsers"
    
    // MARK: Properties
    var instUser: [instructor] = []
   // var inst: instructor!
    var userCountBarButtonItem: UIBarButtonItem!
    
 let ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
    //let usersRef = Database.database().reference().child(Auth.auth().currentUser!.uid)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsMultipleSelectionDuringEditing = false
        
        userCountBarButtonItem = UIBarButtonItem(title: "1",
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(userCountButtonDidTouch))
        userCountBarButtonItem.tintColor = UIColor.white
        navigationItem.leftBarButtonItem = userCountBarButtonItem
        
        
       // let uid = Auth.auth().currentUser!.uid
       // inst = instructor(name: "shaima" , email: uid, password: "123")
        // 1
        ref.observe(.value, with: { snapshot in
            // 2
            var newItems: [instructor] = []
            
            // 3
            for child in snapshot.children {
                // 4
                if let snapshot = child as? DataSnapshot,
                    let stuItem = instructor(snapshot: snapshot) {
                    newItems.append(stuItem)
                }
            }
            
            // 5
            print(newItems.description)
            self.instUser = newItems
            self.tableView.reloadData()
        })
        

    }
    
    
   
    

    
    @objc func userCountButtonDidTouch() {
        performSegue(withIdentifier: listToUsers, sender: nil)
    }

    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instUser.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let inst = instUser[indexPath.row]
        
        cell.textLabel?.text = inst.name
        // cell.detailTextLabel?.text = groceryItem.addedByUser
        
        //  toggleCellCheckbox(cell)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        /*  if editingStyle == .delete {
         items.remove(at: indexPath.row)
         tableView.reloadData()
         }*/
        
        if editingStyle == .delete {
            let inst = instUser[indexPath.row]
            inst.ref?.removeValue()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*  guard let cell = tableView.cellForRow(at: indexPath) else { return }
         var groceryItem = items[indexPath.row]
         let toggledCompletion = !groceryItem.completed
         
         toggleCellCheckbox(cell, isCompleted: toggledCompletion)
         groceryItem.completed = toggledCompletion
         tableView.reloadData() */
        
        // 1
        //   guard let cell = tableView.cellForRow(at: indexPath) else { return }
        // 2
        //  let groceryItem = student[indexPath.row]
        // 3
        //    let toggledCompletion = !groceryItem.completed
        // 4
        //  toggleCellCheckbox(cell, isCompleted: toggledCompletion)
        // 5
        //   groceryItem.ref?.updateChildValues([
        //    "completed": toggledCompletion
        //   ])
    }
    
    func toggleCellCheckbox(_ cell: UITableViewCell, isCompleted: Bool) {
        if !isCompleted {
            cell.accessoryType = .none
            cell.textLabel?.textColor = .black
            // cell.detailTextLabel?.textColor = .black
        } else {
            cell.accessoryType = .checkmark
            cell.textLabel?.textColor = .gray
            //  cell.detailTextLabel?.textColor = .gray
        }
    }
    
}
