//
//  Token.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 17..
//

import Foundation
import Alamofire

class Token: Transferable
{
    var enity: String = "TOKEN"
    
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/auth"
    
    func createJSON() -> [String : Any] {
        print("PASSZ")
        return ["username": "string",
                "password": "string"]
    }
    

}
