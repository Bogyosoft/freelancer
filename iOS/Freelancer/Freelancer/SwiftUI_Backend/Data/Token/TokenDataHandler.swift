//
//  TokenDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 17..
//

import Foundation

class TokenHandler: DataHandler
{
    internal var networkHandler: APICommunicator = APICommunicator()
    
    func get(input: Transferable)
    {
        print("TokenHandler_get()")
        networkHandler.GetRequest(input: input)
    }
    
    func post(input: Transferable)
    {
        print("TokenHandler_create()")
        networkHandler.PostRequest(input: input)
    }
}
