//
//  Item.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 12..
//

import Foundation

class Item:Transferable
{
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/items/"
    let itemHandler = ItemDataHandler()
    var data: ItemData
    
    //SHOULD BE IMPLEMENTED LATER....
    var feladoUser: User = User(inData: UserData(inUser: "proba", inPass: "proba"))
    
    init(inData: ItemData)
    {
        print("Item init...")
        data = inData
    }

    func createJSON() -> [String : Any] {
        let parameters: [String: Any] = [
            "destination": data.destination,
            "id" : 0,
            "properties": data.propertis,
            "source":[
                "id": data.source.id,
                "location": data.source.location,
                "owner":[
                    "username":data.source.ownerName]
            ],
            "status":data.status
        ]
        
        return parameters
    }
    
    
}


class Location: Codable
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



