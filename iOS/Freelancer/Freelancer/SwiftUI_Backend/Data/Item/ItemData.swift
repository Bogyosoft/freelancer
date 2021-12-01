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
    
    init(inDestination: String, inProperties: String, inStatus: String, inSource: SourceData)
    {
        id = 0
        destination = inDestination
        propertis = inProperties
        status = inStatus
        
        source = inSource
        
        //print("SOURCE ID IN ITEMDATA: \(source.id)")
    }
    
}

/*class receivedItemData: Codable
{
    let destination: String
    let id: Int
    let properties: String
    let source: receivedSourceData
    let status: String
}*/
