//
//  User.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/27/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import Foundation

class User{
    
     var first_name: String!
     var last_name: String!
     var id: String!
     var other_person: String!
    
    
    init(firstName : String, lastName : String, idInput : String, otherPerson : String ) {
        self.first_name=firstName
        self.last_name=lastName
        self.id = idInput
        self.other_person=otherPerson
    }
    
    
    
    
    
}
