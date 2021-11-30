//
//  UserData.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//

import Foundation

class UserData: Codable
{
    var id: Int = 0
    var password: String
    var role: String = "default"
    var score: Int = 0
    var username: String
    
    init(inUser: String, inPass: String)
    {
        username = inUser
        password = inPass
    }
}

class receivedUserData: Codable
{
    let id: Int
    let role: String
    let score: Int
    let username: String
}
