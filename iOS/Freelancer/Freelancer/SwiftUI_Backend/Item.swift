//
//  Item.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 12..
//

import Foundation

class Location
{
    var long: Double
    var lat: Double
    
    init(_ln: Double, _lt: Double)
    {
        long = _ln
        lat = _lt
    }
}

enum Status
{
    case NotTaken
    case InProgress
    case Finished
}


class Item
{
    var id: String = ""
    var properties: String = ""
    var destination: Location = Location(_ln: 0.0, _lt: 0.0)
    var status: Status = Status.NotTaken
    
    init()
    {
        print("Item init...")
    }
}

