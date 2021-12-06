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
    
    func get(input: User, completion: @escaping (UserData,Bool) -> Void)
    {
        networkHandler.get(input: input, completion: {(valasz: DataResponse<Any, AFError>) -> Void in
            
            
            if(valasz.response?.statusCode == 400)
            {
                print("ERROR same user")
                completion(UserData(inUser: "", inPass: "", inRole: "", inScore: 0),false)
            }
            else if(valasz.response?.statusCode == 200)
            {
                print("OK: \(String(describing: valasz.response!.statusCode))")
                switch valasz.result
                {
                    case .success:
                        print("SUCCESS WITH COMMUNICaTION")
                    
                    if let data = valasz.data
                    {
                        do
                        {
                            var username = ""
                            var role = ""
                            var score = 0
                            var id = 0
                            let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSArray
                            
                            print("Response: \(String(describing: json))")
                            if json != nil
                            {
                                for elem in json!
                                {
                                    
                                    if let dictionary = elem as? [String: Any]
                                    {
                                        print("KONYVTAR: \(dictionary)")
                                        if let resoonseID = dictionary["id"] as? Int
                                        {
                                            print("ResponseID: \(resoonseID)")
                                            id = resoonseID
                                        }
                                        if let resoonserole = dictionary["role"] as? String
                                        {
                                            print("ResponseID: \(resoonserole)")
                                            role = resoonserole
                                        }
                                        if let resoonseScore = dictionary["score"] as? Int
                                        {
                                            print("ResponseID: \(resoonseScore)")
                                            score = resoonseScore
                                        }
                                        if let resoonseUsername = dictionary["username"] as? String
                                        {
                                            print("ResponseID: \(resoonseUsername)")
                                            username = resoonseUsername
                                        }
                                        
                                        if username == input.data.username
                                        {
                                            print("HAHOOOOOOOO")
                                            let valaszUser = UserData(inUser: username, inPass: "", inRole: role, inScore: score)
                                            completion(valaszUser,true)
                                            return
                                        }
                                    }
                                }
                            }
                        }
                        catch
                        {
                            print("TERMINALIS HIBA VOLT")
                            completion(UserData(inUser: "", inPass: "", inRole: "", inScore: 0),false)
                        }
                    }
                    
                        
                    
                        /*Token.shared.token = self.headerSolver(be: valasz.response!.headers)
                    
                        Token.shared.tokenReceived = true*/
                        /*if let data = valasz.data
                        {
                            let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                            
                            print("Response: \(String(describing: jsonData))")
                            
                            if let dictionary = jsonData as? [String: Any]
                            {
                                print("DICTIONARY\(dictionary)")
                                if let resoonseID = dictionary["id"] as? Int
                                {
                                    print("ResponseID: \(resoonseID)")
                                    id = resoonseID
                                }
                                if let resoonserole = dictionary["role"] as? String
                                {
                                    print("ResponseID: \(resoonserole)")
                                    role = resoonserole
                                }
                                if let resoonseScore = dictionary["score"] as? Int
                                {
                                    print("ResponseID: \(resoonseScore)")
                                    score = resoonseScore
                                }
                                if let resoonseUsername = dictionary["username"] as? String
                                {
                                    print("ResponseID: \(resoonseUsername)")
                                    username = resoonseUsername
                                }
                                
                                if username == input.data.username
                                {
                                    let valaszUser = UserData(inUser: username, inPass: "", inRole: role, inScore: score)
                                    completion(valaszUser,false)
                                }
                            }
                            
                        }*/
                    
                    case .failure:
                        print("ERROR WITH COMMUNICTION")
                    completion(UserData(inUser: "", inPass: "", inRole: "", inScore: 0),false)
                }
            }
            else
            {
                print("ERROR")
                completion(UserData(inUser: "", inPass: "", inRole: "", inScore: 0),false)
            }
            
            print("FINISH")
            
            
        })
    }
    
    
    
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
