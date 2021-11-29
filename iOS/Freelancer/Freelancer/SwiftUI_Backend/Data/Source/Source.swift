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
    //var feladoUser: User = User(inData: UserData(inUser: "proba", inPass: "proba"))
    
    let dataHandler = SourceDataHandler()
    var data: SourceData
    
    init(inData: SourceData)
    {
        print("Creating SOURCE credentials....")
        data = inData
    }
    
    
    func createJSON() -> [String : Any] {
        let parameters: [String: Any] = [
                "id": self.id,
                "location": "TEHULYEEZENVAGYOK",
                "owner":[
                    "id": 5,
                    "password":"dani",
                    "role": "ROLE_USER",
                    "score":0,
                    "username":"Dani"]
        ]
        
        return parameters
    }
    

}
