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

    var transfer:String!
    @IBOutlet weak var tidbitHeadlineText: UILabel!
    @IBOutlet weak var tidbitBlurbText: UITextView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bulletinList: UITableView!
    @IBOutlet weak var tidbitCard: UIView!
    @IBAction func mm(_ sender: Any) {
        
    }
    
    @IBAction func tableclick(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "testid") as! PopupViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        self.present(popOverVC,animated: true)
        popOverVC.view.layer.cornerRadius = 20
        popOverVC.view.backgroundColor = UIColor(white:0, alpha: 0.9)
    }
    
    var fbhandler: FirebaseHandler!
    
    var bulletinListData: [BulletinData]=[] 

    @IBOutlet weak var tidbitTimeStamp: UILabel!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bulletinListData.count // your number of cell here
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TableViewCell",
            for: indexPath) as! BulletinTableViewCell
         
        cell.mainText.text=bulletinListData[indexPath.row].headline
        cell.subText.text=bulletinListData[indexPath.row].details;
        cell.icon.layer.cornerRadius=cell.icon.frame.size.width/2
        cell.icon.clipsToBounds=true
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        
    }
    
    
     func refreshTidbit(newData:Tidbit){
        self.tidbitBlurbText.text=newData.blurb
        self.tidbitHeadlineText.text=newData.headline
        
    }
    
    func updateBlur() {
        // 1
        self.view.isHidden = true
        // 2
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, true, 1)
        // 3
        self.view.drawHierarchy(in: self.view.bounds, afterScreenUpdates: true)
        // 4
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    

    
    
    func updateBulletinList(newData:[BulletinData]){
        bulletinListData=newData
        self.bulletinList.reloadData()
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
        fbhandler.loadTidbitData(view:self)
        fbhandler.loadBulletinData(view: self)
        
        
        
    }
    

    
    func addTapped(sender: AnyObject){
        
    }
    
    func playTapped(sender: AnyObject){
        
    }
    
    

}
