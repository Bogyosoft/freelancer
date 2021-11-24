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
    
    //https://www.raywenderlich.com/35-alamofire-tutorial-getting-started
    //https://stackoverflow.com/questions/30401439/how-could-i-create-a-function-with-a-completion-handler-in-swift
    func own(input: Transferable)
    {
        networkHandler.downloadTags(input: input, completion: {(valasz)->Void in
            print(valasz)
            print("HALO ZSIDO")
        })
    }
}
