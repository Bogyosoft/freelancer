//
//  TokenDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 17..
//

import Foundation
import Alamofire

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
        networkHandler.downloadTags(input: input, completion: {(valasz: DataResponse<Any, AFError>)->Void in
            print("MAJOOOOM \(valasz)")
            switch valasz.result {
                   case .success:
                    print("SIKERES KOMMUNIKÁCIO EL A SZERVER")
                    
                   if let data = valasz.data {
                        let json = try? JSONSerialization.jsonObject(with: data, options: [])
//                      let json = String(data: data, encoding: String.Encoding.utf8)
                        print("Failure Response: \(String(describing: json))")
                        if let dictionary = json as? [String: Any]
                        {
                            if let status = dictionary["status"] as? Int
                            {
                                print("status------\(status)")
                                if(status != 200)
                                {
                                    print("HIBA VAN")
                                }
                                else
                                {
                                    print("MINDEN RENDBEN")
                                }
                                    // access individual value in dictionary
                                    /*
                                    
                                    if input.enity == "SOURCE"
                                    {
                                        ResponseData.shared.szam = number
                                        print("RESPONSE: \(ResponseData.shared.szam)")
                                        // write
                                        /*Flag.shared.queue.sync(flags: .barrier) {
                                            // perform writes on data
                                            
                                            Flag.shared.canGoOn.toggle()
                                            print("FLAG: \(Flag.shared.canGoOn)")
                                        }*/
                                    }*/
                                    
                                }
                                
                            }
                        }
                    
                   case .failure:
                        print("semmi")
                       //error tells me 403
                       //response.result.data can't be cast to NSDictionary or NSArray like
                       //the successful cases, how do I get the response body?
               }
            print("HALO ZSIDO")
        })
    }
}
