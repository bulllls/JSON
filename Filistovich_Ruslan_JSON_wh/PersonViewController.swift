//
//  ViewController.swift
//  Filistovich_Ruslan_JSON_wh
//
//  Created by Ruslan on 10/23/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit
class PersonViewController: UIViewController {
    let session = Session()
    @IBOutlet weak var personTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        personTable.dataSource = self
        personTable.delegate = self
        personTable.tableFooterView = UIView(frame: CGRect.zero)
        personTable.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonTableViewCell")
        
        session.startUrlSession()
        DispatchQueue.main.async {
            self.personTable.reloadData()
        }
    }
}


extension PersonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json.json.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell
        cell?.personName.text = json.json[indexPath.row].name
        cell?.companyName.text = json.json[indexPath.row].company.name
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        personTable.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "PersonInfoViewController", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "PersonInfoViewController") as? PersonInfoViewController else {  return }
        vc.user = json.json[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
