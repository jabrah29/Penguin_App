//
//  Tidbit.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/20/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import Foundation

class Tidbit{
    private var _headline:String!
    private var _blurb:String!
    private var _notify:Bool!
    private var _timestamp:String!
    
    init(headline:String, blurb:String, notify: Bool, timestamp: String) {
        self._headline=headline
        self._blurb=blurb
        self._notify=notify
        self._timestamp=timestamp
    }
    
    var headline: String {
        return _headline
    }
    
    var blurb: String {
        return _blurb
    }
    
    var notify: Bool {
        return _notify
    }
    
    var timestamp: String {
        return _timestamp
    }
    

    
    

}
