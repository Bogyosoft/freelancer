//
//  ItemDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//

import Foundation


class ItemDataHandler
{
    private let networkHandler: APICommunicator = APICommunicator()
    
    func getItems(inputItem: Item)
    {
        print("ItemDataHandler_getItems()")
        networkHandler.GetRequest(input: inputItem)
    }
    
    func createItem(inputItem: Item)
    {
        print("ItemDataHandler_createItem()")
        //get user db for checking id
        //getUsers(inputUser: inputUser)
        networkHandler.PostRequest(input: inputItem)
    }
}
