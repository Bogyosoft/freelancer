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
            //https://developer.apple.com/swift/blog/?id=37
            //https://stackoverflow.com/questions/35088237/any-way-to-get-the-response-body-during-http-errors
            switch response.result {
                   case .success:
                        if let data = response.data {
                            let json = try? JSONSerialization.jsonObject(with: data, options: [])
//                            let json = String(data: data, encoding: String.Encoding.utf8)
                            print("Failure Response: \(String(describing: json))")
                            if let dictionary = json as? [String: Any] {
                                if let number = dictionary["id"] as? Int {
                                    // access individual value in dictionary
                                    print("id------\(number)")
                                }
                                
                            }
                        }
                   case .failure:
                        print("semmi")
                       //error tells me 403
                       //response.result.data can't be cast to NSDictionary or NSArray like
                       //the successful cases, how do I get the response body?
               }
        }
    }

    func GetRequest(input: Transferable)
    {
        AF.request(input.link, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response{response in
            
            debugPrint(response)
        }
        
        
    }
}
