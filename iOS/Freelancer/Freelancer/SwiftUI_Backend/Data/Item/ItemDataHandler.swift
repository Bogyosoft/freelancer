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
    
    func post(input: Item)
    {
        print("ItemDataHandler_create()")
        /*input.source.id = ResponseData.shared.szam
        print("input.source.id = \(input.source.id)")
        if input.source.id == -1
        {
            print("\n\n\nHIBA LÉPETT FEL AZ ITEM REGISZTRÁLÁSAKOR(ROSSZ SOURCE ID)\n\n\n")
            return
        }
        networkHandler.PostRequest(input: input)*/
    }
}
