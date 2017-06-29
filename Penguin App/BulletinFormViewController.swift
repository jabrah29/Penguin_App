//
//  BulletinFormViewController.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/19/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import UIKit

class BulletinFormViewController: UIViewController {

    var picker = UIPickerView()
    @IBAction func saveForm(_ sender: Any) {
        getAllData()
    }
    @IBOutlet weak var headlineText: UITextField!
    @IBOutlet weak var detailsText: UITextView!
    var firebaseHandler:FirebaseHandler!
    let datePicker: UIDatePicker = UIDatePicker()

    @IBOutlet weak var dateText: UITextField!
    @IBAction func dateAction(_ sender: UITextField) {
        
        datePicker.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePicker
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        dateText.inputAccessoryView = toolBar
        
        //datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    

    
    func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        dateText.text = dateFormatter1.string(from: datePicker.date)
        dateText.resignFirstResponder()
    }
    func cancelClick() {
        dateText.resignFirstResponder()
    }
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        dateText.text = dateFormatter.string(from: sender.date)
    }
    @IBAction func timeText(_ sender: UITextField) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let data=BulletinData(headline: headlineText.text!, details: detailsText.text!, date: dateText.text!, time: "3333", timestamp: dateInFormat, user: TableController.current_user.id)
 
        
        firebaseHandler.saveBulletinData(user: (TableController.current_user?.id)!,category: "Bulletin", data: data)
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
