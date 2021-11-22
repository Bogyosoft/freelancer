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
        //get user db for checking id
        //getUsers(inputUser: inputUser)
        networkHandler.PostRequest(input: inputUser)
    }
}
