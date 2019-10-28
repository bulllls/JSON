//
//  ViewController.swift
//  Filistovich_Ruslan_JSON_wh
//
//  Created by Ruslan on 10/23/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit
class PersonViewController: UIViewController {
    @IBOutlet weak var personTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personTable.dataSource = self
        personTable.delegate = self
        personTable.tableFooterView = UIView(frame: CGRect.zero)
        personTable.register(UINib(nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "PersonTableViewCell")
        
        
        
        
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                
                json = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.personTable.reloadData()
                }
                
            } catch let error {
                print(error, "ERROR")
            }
        }.resume()
    }
}


extension PersonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell", for: indexPath) as? PersonTableViewCell
        cell?.personName.text = json[indexPath.row].name
        cell?.companyName.text = json[indexPath.row].company.name
        
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        personTable.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "PersonViewControllerInfo", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "PersonViewControllerInfo") as? PersonViewControllerInfo else {  return }
        vc.user = json[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
