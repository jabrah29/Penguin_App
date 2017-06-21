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
    
    init(headline:String, blurb:String, notify: Bool) {
        self._headline=headline
        self._blurb=blurb
        self._notify=notify
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
    

    
    

}
