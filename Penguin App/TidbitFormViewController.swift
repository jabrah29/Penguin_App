//
//  TidbitFormViewController.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/9/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import UIKit

class TidbitFormViewController: UIViewController {

    @IBOutlet weak var notifySwitch: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var blurbText: UITextView!
    @IBOutlet weak var headlineText: UITextField!
    let rightButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.plain, target: self, action: Selector(("getAllData")))
    
    var firebaseHandler:FirebaseHandler!
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        self.tabBarController?.navigationItem.rightBarButtonItems = [rightButton]
        
        firebaseHandler=FirebaseHandler()
        blurbText.layer.masksToBounds=false
        blurbText.layer.cornerRadius=7
        blurbText.layer.shadowOffset=CGSize(width:0.7,height:0.7)
        blurbText.layer.shadowRadius=1
        blurbText.layer.shadowOpacity=0.2
        

        // Do any additional setup after loading the view.
    }
    
    func getAllData(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        let dateInFormat = dateFormatter.string(from: NSDate() as Date)
        
        let data=Tidbit(headline: headlineText.text!, blurb: blurbText.text, notify: notifySwitch.isOn, timestamp: dateInFormat)
        
        firebaseHandler.saveTidbitData(category: "data", subcategory: "Tidbit", data: data, user:TableController.current_user.id)

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
