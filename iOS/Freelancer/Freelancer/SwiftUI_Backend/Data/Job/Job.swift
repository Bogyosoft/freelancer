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
    
    init(inData: JobData)
    {
        print("Job init....")
        data = inData
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
    
    func createJSON() -> [String : Any] {
        let parameters: [String: Any] = [
            "freelancer": ["id":8,"username":"000000","role":"ROLE_USER","score":0],
            "id" : 0,
            "item":[
                "id":9,"properties":"","destination":"","status":"",
                "source":[
                    "id":9,"location":"locationBe",
                            "owner":[
                                "id":9,"username":"Dani","role":"ROLE_USER","score":0
                                    ]
                        ],
            ]
        ]
        
        return parameters
    }
    
    
}
