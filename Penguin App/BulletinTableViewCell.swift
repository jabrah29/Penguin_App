//
//  BulletinTableViewCell.swift
//  Penguin App
//
//  Created by Jacob Abraham on 6/6/17.
//  Copyright © 2017 Jacob Abraham. All rights reserved.
//

import UIKit

class BulletinTableViewCell: UITableViewCell {


    @IBOutlet weak var icon: UIImageView!

    @IBOutlet weak var subText: UILabel!
    @IBOutlet weak var mainText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
