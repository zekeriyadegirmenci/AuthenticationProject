//
//  User.swift
//  AuthExample
//
//  Created by Zekeriya Değirmenci on 10.02.2025.
//

import Foundation
import FirebaseAuth

struct UserModel {
    let uid:String
    let email:String?
    
    init(user:User){
        self.uid = user.uid
        self.email = user.email
    }
}
