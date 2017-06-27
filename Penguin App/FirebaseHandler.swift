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
        if(FirebaseApp.app()==nil){
             FirebaseApp.configure()
        }
       
    }
    
    
    func loadTidbitData(view:TableController){
        var tidbitLoad:Tidbit!
        self.ref = Database.database().reference()
        ref.child("data").child("Tidbit").observe(.childAdded, with: {(snapshot) in
        
            if let item=snapshot.value as? NSObject{
                let hdline = item.value(forKey: "headline") as? String
                let blurbData = item.value(forKey: "blurb") as? String
                let notifyData=item.value(forKey: "isNotify") as? Bool
                let ts=item.value(forKey: "timestamp") as? String
                tidbitLoad=Tidbit(headline: hdline!, blurb: blurbData!, notify: notifyData!, timestamp: ts!)
                view.refreshTidbit(newData: tidbitLoad)
            }else{
                print("error")
            }
        
        })

        
        
    }
    
    
    func addNewUser(newUser: User){
        self.ref = Database.database().reference()
        
        self.ref.child("Users").child(newUser.id).setValue(saveUser(obj: newUser))
    }
    

    
    
    func loadBulletinData(view:TableController){
        self.ref = Database.database().reference()
        var list=[BulletinData]()
        ref.child("data").child("Bulletin").observe(.value, with: { snapshot in
            for child in snapshot.children {
                
                let convert = child as! DataSnapshot
                 let dict = convert.value as! [String: String]
                let bulletin=BulletinData(headline: dict["headline"]!, details: dict["details"]!, date: dict["date"]!, time: dict["time"]!, timestamp: dict["timestamp"]!)
                list.append(bulletin)
                print(bulletin.timestamp)
                
                
            }
            view.updateBulletinList(newData: list)
        })
    

        
        
    }
    
    func saveBulletinData(category: String , subcategory: String, data:BulletinData){
        self.ref = Database.database().reference()
        
        
        
        self.ref.child(category).child(subcategory).child(data.timestamp).setValue(saveBulletin(obj: data))
        
    }
    
    
    
    
    func saveTidbitData(category: String , subcategory: String, data:Tidbit){
        self.ref = Database.database().reference()
    
        self.ref.child(category).child(subcategory).child(data.timestamp).setValue(saveTidbit(obj:data))
    
    }
    func saveTidbit<T:Tidbit>(obj:T) -> [AnyHashable:Any] {
        return ["headline":obj.headline, "blurb":obj.blurb, "isNotify":obj.notify, "timestamp":obj.timestamp] as [AnyHashable:Any]
    }
    
    
    func saveUser<T:User>(obj:T) -> [AnyHashable:Any]{
        return ["first_name":obj.first_name, "last_name": obj.last_name, "id": obj.id, "other_person": obj.other_person] as [AnyHashable:Any]
    }
    
    func saveBulletin<T:BulletinData>(obj:T) -> [AnyHashable:Any] {
        return ["headline":obj.headline, "details":obj.details, "date":obj.date, "time":obj.time, "timestamp":obj.timestamp] as [AnyHashable:Any]
    }
    func loadData(){
        
        self.ref.child("").setValue("")
    }



}
