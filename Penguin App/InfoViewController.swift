//
//  InfoViewController.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/18/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var imageArray=[UIImage(named:"couple1.jpeg"),UIImage(named:"couple2.jpeg"),UIImage(named:"couple3.jpeg"),
                    UIImage(named:"couple4.jpeg"), UIImage(named:"couple5.jpeg")];
    
    
    @IBOutlet weak var milesApartText: UILabel!
    @IBOutlet weak var meetupDate: UILabel!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        

        cell.contentMode = .scaleAspectFit
        
        cell.img.image=imageArray[indexPath.row]
        return cell;
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
