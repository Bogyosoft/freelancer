//
//  UserDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 26..
//
//
import Foundation
import Alamofire
import SwiftUI

class UserDataHandler
{
    private let networkHandler: APICommunicator = APICommunicator()
    /*func getUsers(inputUser: User)
    {
        print("UserDataHandler_getUser()")
        networkHandler.GetRequest(input: inputUser)
    }
    
    func registerUser(inputUser: User)
    {
        print("UserDataHandler:registerUser()")
        networkHandler.PostRequest(input: inputUser)
    }*/
    
    func post(input: User, completion: @escaping (Bool) -> Void)
    {
        networkHandler.post(input: input, completion: {(valasz: DataResponse<Any, AFError>) -> Void in
            
            
            if(valasz.response?.statusCode == 400)
            {
                print("ERROR same user")
                completion(false)
            }
            else if(valasz.response?.statusCode == 200)
            {
                print("OK: \(String(describing: valasz.response!.statusCode))")
                switch valasz.result
                {
                    case .success:
                        print("SUCCESS WITH COMMUNICaTION")
                        
                        
                        /*Token.shared.token = self.headerSolver(be: valasz.response!.headers)
                    
                        Token.shared.tokenReceived = true*/
                        if let data = valasz.data
                        {
                            let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                            
                            print("Response: \(String(describing: jsonData))")
                            
                            if jsonData != nil
                            {
                                completion(true)
                            }
                            
                        }
                    
                    case .failure:
                        print("ERROR WITH COMMUNICTION")
                        completion(false)
                }
            }
            else
            {
                print("ERROR")
                completion(false)
            }
            
            print("FINISH")
            
            
        })
    }
}
