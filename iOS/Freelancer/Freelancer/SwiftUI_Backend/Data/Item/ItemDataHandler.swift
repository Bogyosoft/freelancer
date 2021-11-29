//
//  ItemDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//

import Foundation
import Alamofire


class ItemDataHandler
{
    internal var networkHandler: APICommunicator = APICommunicator()
    
    func get(input: Item)
    {
        print("ItemDataHandler_get()")
        networkHandler.get(input: input, completion: {(valasz: DataResponse<Any, AFError>)->Void in
        
            print(valasz)
            switch valasz.result {
                   case .success:
                    print("SIKERES KOMMUNIKÁCIO SZERVER")
                    //print("EZ A RESULT: \(valasz.result)")

                    if let data = valasz.data {
                        print("DATA \(data)")
                        let json = try? JSONSerialization.jsonObject(with: data, options: [])
                        print("Failure Response: \(String(describing: json))")
                        //print("JSON:\n\n\n \(json!) \n\n\n:JSON")
                        
                        let decoder = JSONDecoder()

                        do {
                            print("PRÓBAAAAA")
                            let item = try decoder.decode([ItemData].self, from: data)
                            print(item)
                        } catch {
                            print("HIBAAAAAAAA")
                            print(error.localizedDescription)
                        }
                        
                        if let dictionary = json as? [String: Any]
                        {
                            print("KONYVTAR: \(dictionary)")
                            if let destination = dictionary["destination"] as? Int
                            {
                                print("ID: \(destination)\n\n\n")
                                    
                            }
                                
                        }
                    }
                    
                   case .failure:
                        print("semmi")
               }
        
        })
    }
    
    func post(input: Item, completion: @escaping (Bool) -> Void)
    {
        print("ItemDataHandler_create()")
        networkHandler.post(input: input, completion: {(valasz: DataResponse<Any, AFError>) -> Void in
            
            
            if(valasz.response?.statusCode == 400)
            {
                print("ERROR same user")
                completion(false)
            }
            else if(valasz.response?.statusCode == 200)
            {
                print("OK: \(String(describing: valasz.response!.statusCode))")
                switch valasz.result
                {
                    case .success:
                        print("SUCCESS WITH COMMUNICaTION")
                        if let data = valasz.data
                        {
                            let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                            
                            print("Response: \(String(describing: jsonData))")
                            
                            if jsonData != nil
                            {
                                completion(true)
                            }
                            
                        }
                    
                    case .failure:
                        print("ERROR WITH COMMUNICTION")
                        completion(false)
                }
            }
            else
            {
                print("ERROR")
                completion(false)
            }
            
            print("FINISH")
            
            
        })
    
    }
}
