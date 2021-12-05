//
//  Job.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//

import Foundation

class Job: Transferable
{
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/jobs/"
    let jobHandler = JobDataHandler()
    var data: JobData
    var item: Item
    
    init(inData: JobData, itemIn : Item)
    {
        print("Job init....")
        data = inData
        item = itemIn
    }
    
    func createJSON() -> [String : Any] {
        let parameters: [String: Any] = [
            "destination": item.data.destination,
            "id" : item.data.id,
            "properties": item.data.propertis,
            "source":[
                "id": item.data.source.id,
                "location": item.data.source.location,
                "owner":[
                    "username":item.data.source.ownerName]
            ],
            "status":"TO_BE_DELIVERED"
        ]
        
        return parameters
    }
    
    /*func createJSON() -> [String : Any] {
        let parameters: [String: Any] = [
            "freelancer": ["username": data.freelancer],
            "id" : 0,
            "item":[
                "destination": data.item.destination,
                "id" : data.item.id,
                "properties": data.item.propertis,
                "source":[
                            "id": data.item.source.id,
                            "location": data.item.source.location,
                            "owner":[
                                        "id":9,
                                        "username":data.item.source.ownerName,
                                        "role":"ROLE_USER",
                                        "score":0
                                    ]
                        ],
                "status":data.item.status
            ]
        ]
        
        return parameters
    }*/
    
    /*func createJSON() -> [String : Any] {
        let parameters: [String: Any] = [
            "freelancer": ["username":"qq"],
            "id" : -1,
            "item":[
                "id":5,"properties":"","destination":"","status":"",
                "source":[
                    "id":5,"location":"locationBe",
                            "owner":[
                                "username":"D"
                                    ]
                        ],
            ]
        ]
        
        return parameters
    }*/
    
    /*func createJSON() -> [String : Any] {
        let parameters: [String: Any] = [
            "freelancer": ["username":"Dani"],
            "id" : 0,
            "item":item.createJSON()
        ]
        
        return parameters
    }*/
    
    
}
