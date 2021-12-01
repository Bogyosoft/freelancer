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
    
    func get(input: Item, completion: @escaping (Array<ItemData>) -> Void)
    {
        print("ItemDataHandler_get()")
        var items: Array<ItemData> = Array<ItemData>()
        networkHandler.get(input: input, completion: {(valasz: DataResponse<Any, AFError>)->Void in
            switch valasz.result {
                   case .success:
                    print("SIKERES KOMMUNIKÁCIO SZERVER")
                    if let data = valasz.data
                    {
                        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                            
                        print("JSON[0]: \(json[0])")

                        print("Response: \(String(describing: json))")
                        
                        for elem in json
                        {
                            
                            if let dictionary = elem as? [String: Any]
                            {
                                print("KONYVTAR: \(dictionary)")
                                let destination: String = dictionary["destination"] as? String ?? "NIL"
                                let properties: String = dictionary["properties"] as? String ?? "NIL"
                                let status: String = dictionary["status"] as? String ?? "NIL"
                                
                                let source: [String:Any] = dictionary["source"] as? [String:Any] ?? ["NULL":-1]
                                let sourceLocation: String = source["location"] as? String ?? "NIL"
                                
                                let user:[String:Any] = dictionary["owner"] as? [String:Any] ?? ["NULL":-1]
                                
                                let ownerName: String = user["username"] as? String ?? "NIL"
                                
                                print("destination: \(destination)\n\n\n")
                                print("properties: \(properties)\n\n\n")
                                print("status: \(status)\n\n\n")
                                print("source: \(source)\n\n\n")
                                            
                                
                                let ujStatus = SourceData(inputName: ownerName, inputLocation: sourceLocation)
                                
                                let ujItem = ItemData(inDestination: destination, inProperties: properties, inStatus: status, inSource: ujStatus)
                                
                                items.append(ujItem)
                                        
                            }
                            
                        }
                        
                        completion(items)
                            
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
