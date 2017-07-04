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
    
    
    func loadTidbitData(view:TableController, user: String ){
        var tidbitLoad:Tidbit!
        self.ref = Database.database().reference()
        ref.child("data").child(user).child("Tidbit").observe(.childAdded, with: {(snapshot) in
        
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
    
    
    func addInfo(){
        self.ref=Database.database().reference()
        let date = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        let goals=["Make time for each other", "Be nice and show love", "lose weight"]
        
        let info = InfoData(nd: "07-20-17", dm:String(month)+"/"+String(day)+"/2017", gls: goals,m: "07",d: "20")
        self.ref.child("Info").childByAutoId().setValue(saveInfo(obj: info))
    }
    
    
    func removeBulletin(bulletin:BulletinData){
        self.ref=Database.database().reference()
        let profile = self.ref.child("Bulletin").child(bulletin.timestamp)
        profile.observe(.value, with: { (snapshot) -> Void in
            
            
            if snapshot.exists(){
                
                snapshot.ref.removeValue()
            }
        })

    }
    
    
    func addNewUser(newUser: User){
        self.ref = Database.database().reference()
        
        self.ref.child("Users").child(newUser.id).setValue(saveUser(obj: newUser))
    }
    

    
    
    func loadBulletinData(view:TableController, user:String){
        var bullet:BulletinData!
        self.ref = Database.database().reference()
        var list=[BulletinData]()
        ref.child("Bulletin").observe(.value, with: { snapshot in
            for child in snapshot.children {
                let temp: DataSnapshot = (child as? DataSnapshot)!
                if let item=temp.value as? NSObject{
                    let hdline = item.value(forKey: "headline") as? String
                    let det = item.value(forKey: "details") as? String
                    let dateBul=item.value(forKey: "date") as? String
                    let ts=item.value(forKey: "timestamp") as? String
                    let user=item.value(forKey: "userId") as? String
                    let timer=item.value(forKey: "time") as? String
                    bullet = BulletinData(headline: hdline!, details: det!, date: dateBul!, time: timer!, timestamp: ts!, user: user!)
                    
                    list.append(bullet)
                }else{
                    print("error")
                }
//                print(bulletin.timestamp)
//
//                
          }
            view.updateBulletinList(newData: list)
        })
    

        
        
    }
    
    func saveBulletinData(user: String, category: String , data:BulletinData){
        self.ref = Database.database().reference()
        
        self.ref.child(category).child(data.timestamp).setValue(saveBulletin(obj: data))
        
        
        
    }
    
    func saveInfo<T:InfoData>(obj:T) -> [AnyHashable:Any] {
        return ["next_date":obj.next_date, "date_modified":obj.date_modified, "goals":obj.goals, "next_month":obj.next_month, "next_day":obj.next_day] as [AnyHashable:Any]
    }
    
    
    
    func saveTidbitData(category: String , subcategory: String, data:Tidbit, user:String){
        self.ref = Database.database().reference()
    
        self.ref.child(category).child(user).child(subcategory).child(data.timestamp).setValue(saveTidbit(obj:data))
    
    }
    func saveTidbit<T:Tidbit>(obj:T) -> [AnyHashable:Any] {
        return ["headline":obj.headline, "blurb":obj.blurb, "isNotify":obj.notify, "timestamp":obj.timestamp] as [AnyHashable:Any]
    }
    
    
    func saveUser<T:User>(obj:T) -> [AnyHashable:Any]{
        return ["first_name":obj.first_name, "last_name": obj.last_name, "id": obj.id, "other_person": obj.other_person] as [AnyHashable:Any]
    }
    
    func saveBulletin<T:BulletinData>(obj:T) -> [AnyHashable:Any] {
        return ["headline":obj.headline, "details":obj.details, "date":obj.date, "time":obj.time, "timestamp":obj.timestamp, "userId": obj.userId] as [AnyHashable:Any]
    }
    func loadData(){
        
        self.ref.child("").setValue("")
    }



}
