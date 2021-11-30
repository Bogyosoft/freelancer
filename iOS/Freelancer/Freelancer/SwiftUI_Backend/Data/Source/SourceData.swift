//
//  SourceData.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//

import Foundation

class SourceData: Codable
{
    var id: Int
    let location: String
    let ownerName: String
    
    init(inputName: String, inputLocation: String)
    {
        id = -1
        location = inputLocation
        ownerName = inputName
    }
}

class receivedSourceData: Codable
{
    let id: Int
    let location: String
    let owner: receivedUserData
}
