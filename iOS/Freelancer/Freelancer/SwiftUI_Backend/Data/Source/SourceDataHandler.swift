//
//  SourveDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 12..
//

import Foundation
import Alamofire

class SourceDataHandler//: DataHandler
{
    internal var networkHandler: APICommunicator = APICommunicator()
    
    /*func get(input: Transferable)
    {
        print("SourceHandler_get()")
        networkHandler.GetRequest(input: input)
    }
    
    func post(input: Transferable)
    {
        print("SourceHandler_create()")
        networkHandler.PostRequest(input: input)
    }*/
    
    func post(input: Source, completion: @escaping (Bool) -> Void)
    {
        
        networkHandler.post(input: input, completion: {(valasz: DataResponse<Any, AFError>) -> Void in
            
            if(valasz.response?.statusCode != 200)
            {
                print("ERROR")
                completion(false)
            }
            else
            {
                print("VAMOS")
                completion(true)
            }
            print("FINISH")
        })
    }
}
