//
//  ViewController.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/1/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//
import UIKit
import Firebase
import FacebookLogin
import FBSDKLoginKit

class ViewController: UIViewController, UIApplicationDelegate {

    
    @IBAction func fbLogin(_ sender: Any) {
        loginButtonClicked()
    }
    
    
    @IBOutlet weak var pinInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
    }
    


    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name,last_name, picture.type(large),email,updated_time"]).start(completionHandler: { (connection, result, error) -> Void in
                    if (error == nil){
                        var sendId: String!
                        if let userDict = result as? NSDictionary {
                            
                            let first_Name = userDict["first_name"] as! String
                            let last_Name = userDict["last_name"] as! String
                            sendId = userDict["id"] as! String
                            print(first_Name)
                            print(last_Name)
                            
                           // self.addtoFirebase(firstname: first_Name, lastname: last_Name, id: sendId)

                        }else{
                            sendId="none"
                        }
                        
                        if sendId == "1464565813565890"{
                            let destinationController = self.storyboard?.instantiateViewController(withIdentifier: "tomain") as! tabController!
                            self.present(destinationController!, animated: true, completion: nil)
                        }
                }
                })
            }
        }
    }
    
    
    func addtoFirebase(firstname:String, lastname:String, id:String){
       let fbHandler = FirebaseHandler()
        let current = User(firstName: firstname, lastName: lastname, idInput: id, otherPerson: "5568399694")
        fbHandler.addNewUser(newUser: current)
        
    }
    
    
    struct ViewController{
        static let PIN="00"
        
    }
    
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

