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
    @IBOutlet weak var employeesCompanyTable: UITableView!
    var user: User!
    var employees = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        employeesCompanyTable.dataSource = self
        employeesCompanyTable.delegate = self
        nameLabel.text = user.company.name
        catchPhraseLabel.text = user.company.catchPhrase
        bsLabel.text = user.company.bs
    }
    
}

extension CompanyViewControllerInfo: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTableViewCell", for: indexPath)
        cell.textLabel?.text = employees[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        employeesCompanyTable.deselectRow(at: indexPath, animated: true)
    }
}
