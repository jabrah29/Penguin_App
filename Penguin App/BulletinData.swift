//
//  BulletinData.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/19/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import Foundation

class BulletinData{
    
     let headline:String
     let details:String
     let date:String
     let time:String
     let timestamp: String
    
    
    
    init(headline:String, details:String,date:String, time:String, timestamp:String) {
        self.headline=headline
        self.details=details
        self.date=date
        self.time=time
        self.timestamp=timestamp
    }
}
