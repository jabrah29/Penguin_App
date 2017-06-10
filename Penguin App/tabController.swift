//
//  tabController.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/9/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import UIKit

class tabController: UITabBarController,UIPickerViewDataSource,UIPickerViewDelegate {

    var data=["first","second","third"]

    @IBAction func addButton(_ sender: Any) {
        picker.isHidden=false;
    }
    @IBOutlet weak var coupleInfoButton: UIBarButtonItem!
    var picker = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate=self;
        picker.dataSource=self;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row];
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
