//
//  User.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 26..
//

import Foundation

class User: Transferable
{
    var enity: String = "USER"
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/user"

    let dataHandler = UserDataHandler()
    
    
    var id: UUID = UUID()
    var userName: String = "username"
    var passWord: String = "pass"
    var role: String = "default"
    var score: Int = 0
    
    //let handler: UserDataHandler
    
    init(inUserName: String, inPassword: String)
    {
        print("Createing USER credentials....")
        passWord = inPassword
        userName = inUserName
        //handler = UserDataHandler(user: self)
    }
    
    func createJSON() ->[String:Any]
    {
        print("USER CREATE JSON")
        
        let id = 0//ID
        
        let parameters: [String: Any] = [
            "id" : id,
            "password" : self.passWord,
            "role" : self.role,
            "score": self.score,
            "username": self.userName]
        
        print(parameters)
        
        
        /*"List": [
            /*[
                "IdQuestion" : 5,
                "IdProposition": 2,
                "Time" : 32
            ],*/
            /*[
                "IdQuestion" : 4,
                "IdProposition": 3,
                "Time" : 9
            ]*/
        ]*/
        
       
        
        
         return parameters
    }
}
