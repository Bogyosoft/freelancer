//
//  APICommunicator.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 20..
//
//
//https://www.raywenderlich.com/6587213-alamofire-5-tutorial-for-ios-getting-started
//https://codewithchris.com/alamofire/
import Foundation
import Alamofire

class APICommunicator
{
    //https://www.raywenderlich.com/35-alamofire-tutorial-getting-started
    //https://stackoverflow.com/questions/27390656/how-to-return-value-from-alamofire
    //https://stackoverflow.com/questions/30401439/how-could-i-create-a-function-with-a-completion-handler-in-swift
    
    func post(input: Transferable, completion: @escaping (DataResponse<Any, AFError>) -> Void) {
        
        let header = HTTPHeaders(["token" : String(describing: UserSettingsWorker.shared.values["userToken"]!)])
        
        AF.request(input.link, method: .post, parameters: input.createJSON(), encoding: JSONEncoding.default, headers: header)
        .responseJSON { response in
            debugPrint(response)
            //print("POST EREDMENY: \(response.result)!")
            completion(response)
      }
    }
    
    
    func get(input: Transferable, completion: @escaping (DataResponse<Any, AFError>) -> Void) {
      AF.request(input.link, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        .responseJSON { response in
            debugPrint(response)
            //print("GET EREDMENY: \(response.result)!")
            completion(response)
      }
    }
    
    func put(input: Transferable, completion: @escaping (DataResponse<Any, AFError>) -> Void) {
        AF.request(input.link, method: .put, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        .responseJSON { response in
            debugPrint(response)
            //print("GET EREDMENY: \(response.result)!")
            completion(response)
      }
    }
    
    func delete(input: Transferable, completion: @escaping (DataResponse<Any, AFError>) -> Void) {
        AF.request(input.link, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        .responseJSON { response in
            debugPrint(response)
            //print("GET EREDMENY: \(response.result)!")
            completion(response)
      }
    }
}
