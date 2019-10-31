//
//  UserModelBase.swift
//  Filistovich_Ruslan_JSON_wh
//
//  Created by Ruslan on 10/23/19.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import Foundation

struct User: Decodable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
    
}
struct Address: Decodable {
    var street: String
    var suite: String
    var city:String
    var zipcode: String
    var geo: Geo
    
}
struct Geo: Decodable {
    var lat: String
    var lng: String
}
struct Company: Decodable, Equatable {
    var name: String
    var catchPhrase: String
    var bs: String
}

class PersonDataBase {
    var person = [User]()
}

