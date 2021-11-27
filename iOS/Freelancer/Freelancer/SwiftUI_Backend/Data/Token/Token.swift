//
//  Token.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 17..
//

import Foundation
import Alamofire

class Token: Transferable, ObservableObject
{
    
    static let shared = Token()//Singleton
    
    let tokenHandler = TokenHandler()//Handles GET/POST
    
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/auth"
    
    var user: User = User(inData: UserData(inUser: "Dani", inPass: "dani"))
    var token: String = "nil"
    
    @Published var tokenReceived = false
    @Published var alreadyLogedIn = false
    
    func createJSON() -> [String : Any] {
        print("TOKEN_createJSON aka get TOKEN")
        return ["username": user.data.username,
                "password": user.data.password]
    }
    

}
