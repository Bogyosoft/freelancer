//
//  SourceData.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//
//

import Foundation

class SourceData: Codable
{
    var id: Int
    let location: String
    let ownerName: String
    
    init(inputID: Int, inputName: String, inputLocation: String)
    {
        id = inputID
        location = inputLocation
        ownerName = inputName
    }
}
