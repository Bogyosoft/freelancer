//
//  UserDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 26..
//

import Foundation

class UserDataHandler
{
    private let networkHandler: APICommunicator = APICommunicator()
    func getUsers(inputUser: User)
    {
        print("UserDataHandler_getUser()")
        networkHandler.GetRequest(input: inputUser)
    }
    
    func registerUser(inputUser: User)
    {
        print("UserDataHandler:registerUser()")
        networkHandler.PostRequest(input: inputUser)
    }
}
