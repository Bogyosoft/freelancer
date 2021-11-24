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
    
    static let shared = Token()//Singleton
    
    let tokenHandler = TokenHandler()//Handles GET/POST
    
    var enity: String = "TOKEN"
    
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/auth"
    
    var userData: UserData = UserData(inUser: "nil", inPass: "nil")
    
    func createJSON() -> [String : Any] {
        print("TOKEN_createJSON aka get TOKEN")
        return ["username": userData.username,
                "password": userData.password]
    }
    

}
