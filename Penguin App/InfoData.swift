//
//  InfoData.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/29/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import Foundation

class InfoData{
    var next_date: String!
    var next_month: String!
    var next_day: String!
    var date_modified: String!
    var goals: [String]!

    
    
    init(nd:String, dm:String, gls:[String], m:String, d: String) {
        self.next_date=nd
        self.date_modified=dm
        self.goals=gls
        self.next_month=m
        self.next_day=d

    }
}
