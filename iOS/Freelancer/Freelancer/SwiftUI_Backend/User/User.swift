//
//  User.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 26..
//

import Foundation

class User
{
    var id: String = "nil"
    var userName: String = "username"
    var passWord: String = "pass"
    var role: String = "role"
    var score: Int = 0
    
    init(inID: String, inUserName: String)
    {
        print("Createing USER credetials....")
        id = inID
        userName = inUserName
    }
}
