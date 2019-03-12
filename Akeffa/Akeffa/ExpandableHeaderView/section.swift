//
//  section.swift
//  cloudstoreexp
//
//  Created by Morooj on 26/05/1440 AH.
//  Copyright © 1440 Bashayr Hindi. All rights reserved.
//

import Foundation
struct section {

    var group : String!
    
    var letterOne : [String]!

    var expanded: Bool!
    
    
    init(group: String, letterOne: [String], expanded: Bool) {
        self.group = group
        self.letterOne = letterOne
        self.expanded = expanded
    }
    

}
