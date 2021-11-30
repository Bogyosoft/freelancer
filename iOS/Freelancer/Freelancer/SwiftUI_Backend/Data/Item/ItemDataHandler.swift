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
            switch valasz.result {
                   case .success:
                        print("SIKERES KOMMUNIKÁCIO SZERVER")
                        if let data = valasz.data
                    {
                            let json = try? JSONSerialization.jsonObject(with: data, options: [])
                            print("Response: \(String(describing: json))")
                            print("BDOY::::\(valasz.data)")
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
                                    print("destination: \(destination)\n\n\n")
                                        
                                }
                                    
                            }
                    }
                    
                   case .failure:
                        print("semmi")
               }
        
        })
        
        /*networkHandler.get(input: input, completion: {(valasz: DataResponse<Any, AFError>) -> Void in
            
            print("\n\n\nRESSSSSSULT: \(valasz.data.flatMap { $0 }) RESULLLLLLT\n\n\n")
            //var eredmenyID = -1
            if(valasz.response?.statusCode != 200)
            {
                print("ERROR")
                //completion(false, -1)
            }
            else
            {
                print("VAMOS")
                print("OK: \(String(describing: valasz.response!.statusCode))")
                switch valasz.result
                {
                    case .success:
                        print("SUCCESS WITH COMMUNICaTION")
                        
                        
                        /*Token.shared.token = self.headerSolver(be: valasz.response!.headers)
                    
                        Token.shared.tokenReceived = true*/
                    
                        if let data = valasz.data
                        {
                            let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                            
                            print("Response: \(jsonData)")
                            //var jsonResult = jsonData as! Dictionary<String, AnyObject>
                            
                            if let dictionary = jsonData as? [String:[String: Any]]
                            {
                                print("DICTIOARY: \(dictionary)")
                                if let resoonseID = dictionary["id"] as? Int
                                {
                                    print("ResponseID: \(resoonseID)")
                                    //completion(true, resoonseID)
                                    //eredmenyID = resoonseID
                                }
                            }
                            
                            
                        }
                    
                    case .failure:
                        print("ERROR WITH COMMUNICTION")
                    //completion(false,-1)
                }
                //completion(true,eredmenyID)
            }
            print("FINISH")
        })*/
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
