//
//  ItemData.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//

import Foundation

class ItemData: Codable, Identifiable
{
    var id: Int
    var destination: String
    var propertis: String
    var status: String
    var source: SourceData
    
    init(inID: Int, inDestination: String, inProperties: String, inStatus: String, inSource: SourceData)
    {
        id = inID
        destination = inDestination
        propertis = inProperties
        status = inStatus
        source = inSource
    }
    
}
