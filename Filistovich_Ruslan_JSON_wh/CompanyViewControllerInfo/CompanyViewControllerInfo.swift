//
//  CompanyViewControllerInfo.swift
//  Filistovich_Ruslan_JSON_wh
//
//  Created by Ruslan on 10/26/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class CompanyViewControllerInfo: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var catchPhraseLabel: UILabel!
    @IBOutlet weak var bsLabel: UILabel!
    var user: User!
    var employees = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.company.name
        catchPhraseLabel.text = user.company.catchPhrase
        bsLabel.text = user.company.bs
    }
    
}
