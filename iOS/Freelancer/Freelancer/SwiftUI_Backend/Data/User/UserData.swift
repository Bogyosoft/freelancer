//
//  UserData.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//

import Foundation

class UserData: Codable
{
    let id: Int
    let password: String
    let role: String
    let score: Int
    let username: String
}
