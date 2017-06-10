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

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bulletinList: UITableView!
    @IBOutlet weak var tidbitCard: UIView!

    let transportItems = ["Plane","Train","Car","Scooter","Caravan"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transportItems.count // your number of cell here
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableViewCell",
            for: indexPath) as! BulletinTableViewCell
        
        cell.mainText.text=transportItems[indexPath.row]
        
        cell.subText.text="sub-text";
        cell.icon.layer.cornerRadius=cell.icon.frame.size.width/2
        cell.icon.clipsToBounds=true
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        // cell selected code here
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        
        
    }
    
    func addTapped(sender: AnyObject){
        
    }
    
    func playTapped(sender: AnyObject){
        
    }
    
    

}
