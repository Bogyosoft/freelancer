//
//  User.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 26..
//

import Foundation

class User: Transferable
{
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/user"
    let dataHandler = UserDataHandler()//OWN HANDLER FOR COMMUNICATION
    var data: UserData//OWN DATA 
    
    init(inData: UserData){
        print("Createing USER credentials....")
        data = inData
    }
    
//  MARK: creates JSON format from data
    func createJSON() ->[String:Any]{
        print("USER CREATE JSON")
        
        let parameters: [String: Any] = [
            "id" : self.data.id,
            "password" : self.data.password,
            "role" : self.data.role,
            "score": self.data.score,
            "username": self.data.username]
        
        print(parameters)
         return parameters
    }
}
