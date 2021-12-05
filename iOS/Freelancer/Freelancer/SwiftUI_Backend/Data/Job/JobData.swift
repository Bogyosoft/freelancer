//
//  JobData.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 29..
//

import Foundation

class JobData: Codable, Identifiable
{
    var freelancer: String//user aki felveszi a munkat
    var id: Int
    var item: ItemData
    
    init(inID: Int, inFreelancer: String, inItem: ItemData)
    {
        id = inID
        freelancer = inFreelancer
        item = inItem
    }
}