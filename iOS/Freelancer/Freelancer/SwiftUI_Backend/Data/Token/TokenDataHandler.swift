//
//  TokenDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 17..
//
//

import Foundation
import Alamofire

class TokenHandler//: DataHandler
{
    internal var networkHandler: APICommunicator = APICommunicator()
    
    //https://www.raywenderlich.com/35-alamofire-tutorial-getting-started
    //https://stackoverflow.com/questions/30401439/how-could-i-create-a-function-with-a-completion-handler-in-swift
//  MARK: post Token with completionHandler
    func post(input: Transferable, completion: @escaping (Bool) -> Void){
        Token.shared.tokenReceived = false
        networkHandler.post(input: input, completion: {(valasz: DataResponse<Any, AFError>)->Void in
            if(valasz.response?.statusCode != 200)
            {
                print("ERROR")
                completion(false)
            }
            else
            {
                print("OK: \(String(describing: valasz.response!.statusCode))")
                switch valasz.result
                {
                    case .success:
                        print("SUCCESS WITH COMMUNICaTION")
                        
                    
                        Token.shared.token = self.headerSolver(be: valasz.response!.headers)
                    
                        Token.shared.tokenReceived = true
                        /*if let data = valasz.data
                        {
                            let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                            print("Failure Response: \(String(describing: jsonData))")
                        }*/
                        
                    case .failure:
                        print("ERROR WITH COMMUNICTION")
                        completion(false)
                }
            }
            
            print("POST FINISHED")
            
            completion(true)
        })
        
        
    }
//  MARK: header solver
    func headerSolver(be: HTTPHeaders)->String{
        //print("HEADER:\n\n\n \(String(describing: be)) \n\n\n:HEADER")
        //print("VALUE:\n\n\n \(String(describing: be.value(for: "Set-Cookie")!)) \n\n\n:VALUE")
        return tokenMiner(input: String(describing: be.value(for: "Set-Cookie")!))
    }
//  MARK: returns token
    func tokenMiner(input: String)->String{
        let arr : [String] = input.components(separatedBy: ";")
        //print("ARRAY: \(arr)")
        var token = arr[0]
        for _ in 0...5
        {
            token.remove(at: token.startIndex)
        }
        return token
       
    }
}
