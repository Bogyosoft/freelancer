//
//  JobDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 29..
//
//

import Foundation
import Alamofire


class JobDataHandler
{
    internal var networkHandler: APICommunicator = APICommunicator()
    
    func post(input: Job, completion: @escaping (Bool) -> Void)
    {
        print("JobDataHandler_create()")
        networkHandler.post(input: input, completion: {(valasz: DataResponse<Any, AFError>) -> Void in
            
            
            if(valasz.response?.statusCode == 400)
            {
                print("ERROR VALAMI BAJ VAN")
                completion(false)
            }
            else if(valasz.response?.statusCode == 500)
            {
                print("FRANC TUDJA")
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
    
    func get(input: Job, completion: @escaping (Array<JobData>, Bool) -> Void)
    {
        print("ItemDataHandler_get()")
        var jobs: Array<JobData> = Array<JobData>()
        networkHandler.get(input: input, completion: {(valasz: DataResponse<Any, AFError>)->Void in
            switch valasz.result {
                   case .success:
                    print("SIKERES KOMMUNIKÁCIO SZERVER - JOBDATA_GET")
                    if let data = valasz.data
                    {
                        do
                        {
                            let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                            
                            //print("JSON[0]: \(json[0])")

                            print("Response: \(String(describing: json))")
                            
                            for elem in json
                            {
                                
                                if let dictionary = elem as? [String: Any]
                                {
                                    print("KONYVTAR MUNKA: \(dictionary)")
                                    
                                    let id: Int = dictionary["id"] as? Int ?? -1
                                    
                                    let item: [String:Any] = dictionary["item"] as? [String:Any] ?? ["NULL":-1]
                                    
                                    let freelancer: [String:Any] = dictionary["freelancer"] as? [String:Any] ?? ["NULL":-1]
                                    
                                    let source: [String:Any] = item["source"] as? [String:Any] ?? ["NULL":-1]
                                    
                                    let user:[String:Any] = dictionary["owner"] as? [String:Any] ?? ["NULL":-1]
                                    
                                    let destinationItem: String = item["destination"] as? String ?? "NIL"
                                    let propertiesItem: String = item["properties"] as? String ?? "NIL"
                                    let statusItem: String = item["status"] as? String ?? "NIL"
                                    
                                    
                                    let sourceLocation: String = source["location"] as? String ?? "NIL"
                                    let ownerName: String = user["username"] as? String ?? "NIL"
                                    let freelancerGuy: String = freelancer["username"] as? String ?? "NIL"
                                    
                                    print("destination: \(destinationItem)\n\n\n")
                                    print("properties: \(propertiesItem)\n\n\n")
                                    print("status: \(statusItem)\n\n\n")
                                    print("source: \(source)\n\n\n")
                                                
                                
                                    let ujStatus = SourceData(inputID: -1, inputName: ownerName, inputLocation: sourceLocation)
                                    
                                    let ujItem = ItemData(inID: id, inDestination: destinationItem, inProperties: propertiesItem, inStatus: statusItem, inSource: ujStatus)
                                    
                                    //let itemForJob = Item(inData: ujItem)
                                    
                                    let ujJob = JobData(inID: id, inFreelancer: freelancerGuy, inItem: ujItem)
                                    
                                    jobs.append(ujJob)
                                            
                                }
                                
                            }
                            
                            completion(jobs, true)
                        }
                        catch
                        {
                            print("VALAMI HIBA VOLT")
                        }
                        
                            
                        
                            
                    }
                    
                   case .failure:
                        print("semmi")
               }
        
        })
        
    }
    
    func put(input: Job, completion: @escaping (Bool) -> Void)
    {
        print("ItemDataHandler_put()")
        input.link = input.link + String(describing: input.data.id)
        networkHandler.put(input: input, completion: {(valasz: DataResponse<Any, AFError>)->Void in
                if(valasz.response?.statusCode == 400)
                {
                    print("ERROR VALAMI BAJ VAN")
                    completion(false)
                }
                else if(valasz.response?.statusCode == 500)
                {
                    print("FRANC TUDJA")
                    completion(false)
                }
                else if(valasz.response?.statusCode == 200)
                {
                    completion(true)
                }
                else
                {
                    print("ERROR")
                    completion(false)
                }
        })
    }
    func delete(input: Job, completion: @escaping (Bool) -> Void)
    {
        print("ItemDataHandler_delete()")
        input.link = input.link + String(describing: input.data.id)
        networkHandler.delete(input: input, completion: {(valasz: DataResponse<Any, AFError>)->Void in
                if(valasz.response?.statusCode == 400)
                {
                    print("ERROR VALAMI BAJ VAN")
                    completion(false)
                }
                else if(valasz.response?.statusCode == 500)
                {
                    print("FRANC TUDJA")
                    completion(false)
                }
                else if(valasz.response?.statusCode == 200)
                {
                    completion(true)
                }
                else
                {
                    print("ERROR")
                    completion(false)
                }
        })
    }

}
