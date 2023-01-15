//
//  UserModel.swift
//  MiniApps
//
//  Created by Jimmi Oh on 15/01/23.
//

import SwiftyJSON

struct UserModel {
    
    let firstName: String
    let lastName: String
    let email: String
    let avatar: String
    let id: Int
    
    init(json: JSON) {
        firstName = json["first_name"].stringValue
        lastName = json["last_name"].stringValue
        email = json["email"].stringValue
        avatar = json["avatar"].stringValue
        id = json["first_name"].intValue
    }
}
