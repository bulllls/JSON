//
//  PersonViewControllerInfo.swift
//  Filistovich_Ruslan_JSON_wh
//
//  Created by Ruslan on 10/26/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class PersonInfoViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var suiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.name
        usernameLabel.text = user.username
        emailLabel.text = user.email
        streetLabel.text = user.address.street
        suiteLabel.text = user.address.suite
        cityLabel.text = user.address.city
        zipcodeLabel.text = user.address.zipcode
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
    }

}
