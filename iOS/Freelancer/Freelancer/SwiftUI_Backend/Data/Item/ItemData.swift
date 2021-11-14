//
//  ItemData.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//

import Foundation

class ItemData: Codable
{
    let id: Int
    let destination: String
    let propertis: String
    let source: SourceData
    let status: String
    
}
