//
//  Item.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 12..
//

import Foundation

class Item:Transferable
{
    var enity: String = "ITEM"
    var id: String = ""
    var properties: String = ""
    var destination: Location = Location(_ln: 0.0, _lt: 0.0)
    var status: Status = Status.NotTaken
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/items/"
    
    var source: Source = Source()
    
    //SHOULD BE IMPLEMENTED LATER....
    var feladoUser: User = User(inUserName: "ITEM_CLASS", inPassword: "itemclass")
    
    init()
    {
        print("Item init...")
    }

    func createJSON() -> [String : Any] {
        //let id = 0//ID
        
        let parameters: [String: Any] = [
            "destination": "cel",
            "id" : 10,
            "properties": "tulajdonsag",
            "source":[
                "id": source.id,
                "location": source.location,
                "owner":[
                    "id": 1,
                    "password":"ios",
                    "role": "king",
                    "score":0,
                    "username":"iOS"]
            ],
            "status":"statusz"
        ]
        
        return parameters
    }
    
    
}


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



