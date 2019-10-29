//
//  URLSession.swift
//  Filistovich_Ruslan_JSON_wh
//
//  Created by Ruslan on 10/27/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import Foundation
class Session {
    func startUrlSession() {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                json.json = try JSONDecoder().decode([User].self, from: data)
            } catch let error {
                print(error, "ERROR")
            }
        }.resume()
    }
}

