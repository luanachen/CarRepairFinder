//
//  RepairShopTableViewCell.swift
//  CarRepairFinder
//
//  Created by Luana on 05/03/18.
//  Copyright © 2018 lccj. All rights reserved.
//

import UIKit

class RepairShopTableViewCell: UITableViewCell {

    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var shopAddressLabel: UILabel!
    @IBOutlet weak var shopStatusLabel: UILabel!
    @IBOutlet weak var shopImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
