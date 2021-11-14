//
//  Source.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 12..
//

import Foundation

class Source: Transferable
{
    var id: Int = -1
    var location: String = "sourceLocation"
    var enity: String = "SOURCE"
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/sources/"
    
    //SHOULD BE IMPLEMENTED LATER....
    var feladoUser: User = User(inUserName: "ITEM_CLASS", inPassword: "itemclass")
    
    func createJSON() -> [String : Any] {
        let parameters: [String: Any] = [
                "id": self.id,
                "location": "valamiLocation",
                "owner":[
                    "id": 1,
                    "password":"ios",
                    "role": "king",
                    "score":0,
                    "username":"iOS"]
        ]
        
        return parameters
    }
    

}
