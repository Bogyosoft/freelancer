//
//  APICommunicator.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 20..
//
//https://www.raywenderlich.com/6587213-alamofire-5-tutorial-for-ios-getting-started
//https://codewithchris.com/alamofire/
import Foundation
import Alamofire

class APICommunicator
{
    
    func PostRequest(input: Transferable)
    {
        print("POST")
        
        AF.request(input.link, method: .post, parameters: input.createJSON(), encoding: JSONEncoding.default, headers: nil).response{response in
            
            debugPrint(response)
            print("RESULT: \(response.result)!")
        }
    }

    func GetRequest(input: Transferable)
    {
        AF.request(input.link, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response{response in
            
            debugPrint(response)
        }
        
        
    }
}
