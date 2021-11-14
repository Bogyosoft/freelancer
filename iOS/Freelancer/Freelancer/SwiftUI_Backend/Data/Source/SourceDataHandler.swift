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
        print("SourceHandler_get()")
        networkHandler.GetRequest(input: input)
    }
    
    func post(input: Transferable)
    {
        print("SourceHandler_create()")
        networkHandler.PostRequest(input: input)
    }
}
