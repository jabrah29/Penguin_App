//
//  FirebaseHandler.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/19/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import Foundation
import Firebase

class FirebaseHandler{
    
    static  let ROOT_PATH="https://penguin-9dc21.firebaseio.com/"

    var ref: DatabaseReference!
    

    
    init() {
        FirebaseApp.configure()

    }
    
    func checkStatus(category:String, subCategory:String, id:String)->Bool{
        var temp=false
        ref.child(category).observeSingleEvent(of: DataEventType.value, with: { (snapshot) in
            
            if snapshot.hasChild(id){
                
                temp=true
                
            }else{
                
               temp=false
            }
        })
         return temp
       
    }
    
    
    func saveTidbitData(category: String , subcategory: String, data:Tidbit){
        self.ref = Database.database().reference()

        
    
        self.ref.child(category).child(subcategory).setValue(saveTidbit(obj:data))
    
    }
    func saveTidbit<T:Tidbit>(obj:T) -> [AnyHashable:Any] {
        return ["headline":obj.headline, "blurb":obj.blurb, "isNotify":obj.notify] as [AnyHashable:Any]
    }
    func loadData(){
        
        self.ref.child("").setValue("")
    }



}
