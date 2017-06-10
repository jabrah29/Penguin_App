//
//  ViewController.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/1/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pinInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    struct ViewController{
        static let PIN="00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButton(_ sender: UIButton) {
        if pinInput.text == ViewController.PIN {
            
        }else{
            let alert = UIAlertController(title: "Attention", message: "Invalid Pin", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

