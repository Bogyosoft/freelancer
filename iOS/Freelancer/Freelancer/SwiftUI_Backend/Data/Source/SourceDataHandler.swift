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
    
    func post(input: Source, completion: @escaping (Bool, Int) -> Void)
    {
        
        networkHandler.post(input: input, completion: {(valasz: DataResponse<Any, AFError>) -> Void in
            
            var eredmenyID = -1
            if(valasz.response?.statusCode != 200)
            {
                print("ERROR")
                completion(false, -1)
            }
            else
            {
                print("VAMOS")
                print("OK: \(String(describing: valasz.response!.statusCode))")
                switch valasz.result
                {
                    case .success:
                        print("SUCCESS WITH COMMUNICaTION")
                        if let data = valasz.data
                        {
                            let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                            
                            print("Response FOR SOURCEPOST: \(String(describing: jsonData))")
                            
                            
                            
                            
                            if let dictionary = jsonData as? [String: Any]
                            {
                                print("DICTIONARY\(dictionary)")
                                if let resoonseID = dictionary["id"] as? Int
                                {
                                    print("ResponseID: \(resoonseID)")
                                    //completion(true, resoonseID)
                                    eredmenyID = resoonseID
                                }
                            }
                            
                            
                        }
                    
                    case .failure:
                        print("ERROR WITH COMMUNICTION")
                    completion(false,-1)
                }
                completion(true,eredmenyID)
            }
            print("FINISH")
        })
    }
}
