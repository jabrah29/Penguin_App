//
//  PopupViewController.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/25/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var eventCreated: UITextField!
    @IBOutlet weak var eventDetail: UITextView!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var popUpView: UIView!
    
    
    
    var event_title:String!
    var event_detail:String!
    var event_time:String!
    var event_date:String!
    var event_created:String!
    
    @IBAction func cancel(_ sender: Any) {
       self.removeAnimate()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.masksToBounds=false
        popUpView.layer.cornerRadius=5
        popUpView.layer.shadowOffset=CGSize(width:0.5,height:0.5)
        popUpView.layer.shadowRadius=1
        popUpView.layer.shadowOpacity=0.2
        self.eventTitle.text=event_title
        self.eventDate.text=event_date
        self.eventTime.text=event_time
        self.eventCreated.text=event_created
        self.eventDetail.text=event_detail
        self.showAnimate()

    }
    

    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
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
