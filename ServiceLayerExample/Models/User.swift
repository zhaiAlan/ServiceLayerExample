//
//  User.swift
//  ServiceLayerExample
//
//  Created by zxz  on 3/22/24.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String

    //Note - not all properties are accounted for.
    //See the users.json file for all the available properties of a User.
}
