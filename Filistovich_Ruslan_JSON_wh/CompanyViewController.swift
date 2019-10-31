//
//  CompanyViewController.swift
//  Filistovich_Ruslan_JSON_wh
//
//  Created by Ruslan on 10/24/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {
    @IBOutlet weak var companyTable: UITableView!
    let session = Session()
    override func viewDidLoad() {
        super.viewDidLoad()
        companyTable.dataSource = self
        companyTable.delegate = self
        companyTable.tableFooterView = UIView(frame: CGRect.zero)
        companyTable.register(UINib(nibName: "CompanyTableViewCell", bundle: nil), forCellReuseIdentifier: "CompanyTableViewCell")
        session.startUrlSession {
            DispatchQueue.main.async {
                self.update()
            }
        }
    }
    func update() {
        self.companyTable.reloadData()
    }
}

extension CompanyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return session.dataBasePerson.person.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTableViewCell", for: indexPath) as? CompanyTableViewCell
        cell?.companyLabel.text = session.dataBasePerson.person[indexPath.row].company.name
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        companyTable.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "CompanyInfoViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "CompanyInfoViewController") as? CompanyInfoViewController else {  return }
        vc.user = session.dataBasePerson.person[indexPath.row]
        vc.employees = session.dataBasePerson.person.filter{$0.company == session.dataBasePerson.person[indexPath.row].company}
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
