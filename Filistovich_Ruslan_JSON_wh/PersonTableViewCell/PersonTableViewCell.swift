//
//  TableViewCell.swift
//  Filistovich_Ruslan_JSON_wh
//
//  Created by Ruslan on 10/24/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var companyName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
