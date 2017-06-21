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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.plain, target: self, action: nil)

        self.tabBarController?.navigationItem.rightBarButtonItems = [rightButton]
        
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
