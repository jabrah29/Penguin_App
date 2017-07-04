//
//  TableViewController.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/6/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import UIKit


class TableController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var countDownCard: UIView!
    @IBOutlet weak var hoursLeftText: UILabel!
    @IBOutlet weak var minuteLeftText: UILabel!

    @IBOutlet weak var daysLeftText: UILabel!
    @IBOutlet weak var tidbitHeadlineText: UILabel!
    @IBOutlet weak var tidbitBlurbText: UITextView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bulletinList: UITableView!
    @IBOutlet weak var tidbitCard: UIView!
    @IBAction func mm(_ sender: Any) {
        
    }
    
    static var current_user:User!
    
   var namesList = ["Jacob", "Vinutha"]
    
    
    var groupList: [(String, [BulletinData])] = [("Jacob",[]),("Vinutha",[])]
    
    static func setUser(usr: User){
        current_user=User(firstName: usr.first_name, lastName: usr.last_name, idInput: usr.id, otherPerson: usr.other_person)
    }


    
    var fbhandler: FirebaseHandler!
    
    var bulletinListData: [BulletinData]=[] 

    @IBOutlet weak var tidbitTimeStamp: UILabel!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupList[section].1.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableViewCell",
            for: indexPath) as! BulletinTableViewCell
        if groupList[indexPath.section].1.count > 0 {

        
        
            cell.mainText.text=groupList[indexPath.section].1[indexPath.row].headline
            cell.subText.text=groupList[indexPath.section].1[indexPath.row].details;
            cell.icon.layer.cornerRadius=cell.icon.frame.size.width/2
            cell.icon.clipsToBounds=true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "testid") as! PopupViewController
        self.addChildViewController(popOverVC)
        popOverVC.event_title = String(groupList[indexPath.section].1[indexPath.row].headline)
        popOverVC.event_date = String(groupList[indexPath.section].1[indexPath.row].date)
        popOverVC.event_time = String(groupList[indexPath.section].1[indexPath.row].time)
        popOverVC.event_detail = String(groupList[indexPath.section].1[indexPath.row].details)
        popOverVC.event_created = String(groupList[indexPath.section].1[indexPath.row].timestamp)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }
    
    
     func refreshTidbit(newData:Tidbit){
        self.tidbitBlurbText.text=newData.blurb
        self.tidbitHeadlineText.text=newData.headline
        
    }
    

    
    
    func updateBulletinList(newData:[BulletinData]){
        let tempbulletinListData=newData
        var currList=[BulletinData]()
        var otherList=[BulletinData]()
        for bulletin in tempbulletinListData{
            if bulletin.userId == TableController.current_user.id {
                
                currList.append(bulletin)
            }else{
                otherList.append(bulletin)
            }
        }
        bulletinListData=tempbulletinListData
        groupList[0].1=currList
        groupList[1].1=otherList

        self.bulletinList.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            fbhandler.removeBulletin(bulletin: groupList[indexPath.section].1[indexPath.row])

            
           // updateBulletinList(newData: bulletinListData)
              groupList[indexPath.section].1.remove(at: indexPath.row)

            bulletinList.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return namesList[section]
    }
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        fbhandler=FirebaseHandler()
        
        // Do any additional setup after loading the view, typically from a nib.
        //self.tableView.dataSource=self;
        tidbitCard.layer.masksToBounds=false
        tidbitCard.layer.cornerRadius=5
        tidbitCard.layer.shadowOffset=CGSize(width:0.5,height:0.5)
        tidbitCard.layer.shadowRadius=1
        tidbitCard.layer.shadowOpacity=0.2
        

        
        bulletinList.isScrollEnabled = false;
        
        bulletinList.layer.masksToBounds=false
        bulletinList.layer.cornerRadius=5
        bulletinList.layer.shadowOffset=CGSize(width:0.5,height:0.5)
        bulletinList.layer.shadowRadius=1
        bulletinList.layer.shadowOpacity=0.2
        
        self.bulletinList.tableFooterView = UIView()

        
        countDownCard.layer.masksToBounds=false
        countDownCard.layer.cornerRadius=5
        countDownCard.layer.shadowOffset=CGSize(width:0.5,height:0.5)
        countDownCard.layer.shadowRadius=1
        countDownCard.layer.shadowOpacity=0.2
        
        self.bulletinList.delegate=self;
        self.bulletinList.dataSource=self;
        
        
        
        self.tidbitCard.layoutIfNeeded()
        self.profileImage.layer.cornerRadius=profileImage.frame.size.width/2;
        self.profileImage.clipsToBounds=true
        
        fbhandler=FirebaseHandler()

        
        fbhandler.loadTidbitData(view:self, user: TableController.current_user.id)
        fbhandler.loadBulletinData(view: self, user: TableController.current_user.id)
        
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }

    
    func addTapped(sender: AnyObject){
        
    }
    
    func playTapped(sender: AnyObject){
        
    }
    
    

}
