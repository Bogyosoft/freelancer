//
//  SourveDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 12..
//

import Foundation

class SourceHandler: DataHandler
{
    internal var networkHandler: APICommunicator = APICommunicator()
    
    func get(input: Transferable)
    {
        print("SourceHandler_getItems()")
        networkHandler.GetRequest(input: input)
    }
    
    func create(input: Transferable)
    {
        print("SourceHandler_createItem()")
        //get user db for checking id
        //getUsers(inputUser: inputUser)
        networkHandler.PostRequest(input: input)
    }
}
