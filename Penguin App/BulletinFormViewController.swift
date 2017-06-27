//
//  BulletinFormViewController.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/19/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import UIKit

class BulletinFormViewController: UIViewController {

    
    @IBOutlet weak var headlineText: UITextField!
    @IBOutlet weak var detailsText: UITextView!
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var timeText: UITextField!
    var firebaseHandler:FirebaseHandler!

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.plain, target: self, action: Selector(("getAllData")))

        self.tabBarController?.navigationItem.rightBarButtonItems = [rightButton]
        
        firebaseHandler=FirebaseHandler()

        
        detailsText.layer.masksToBounds=false
        detailsText.layer.cornerRadius=7
        detailsText.layer.shadowOffset=CGSize(width:0.7,height:0.7)
        detailsText.layer.shadowRadius=1
        detailsText.layer.shadowOpacity=0.2

        

      // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAllData(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dateInFormat = dateFormatter.string(from: NSDate() as Date)
        let data=BulletinData(headline: headlineText.text!, details: detailsText.text!, date: dateText.text!, time: timeText.text!, timestamp: dateInFormat)
        
        firebaseHandler.saveBulletinData(category: "data", subcategory: "Bulletin", data: data)
        let alertController = UIAlertController(title: "Success", message: "Hit back button to go back", preferredStyle: .alert)
        
        // Create the actions
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            
        }
        
        // Add the actions
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
        
        // Present the controller
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
