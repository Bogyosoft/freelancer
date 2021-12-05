//
//  Source.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 12..
//
//
import Foundation

class Source: Transferable
{
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
                "id": data.id,
                "location": data.location,
                "owner":[
                    "username": data.ownerName]
                ]
        
        return parameters
    }
    

}
