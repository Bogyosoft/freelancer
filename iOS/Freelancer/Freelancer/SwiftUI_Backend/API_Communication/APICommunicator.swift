//
//  APICommunicator.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 20..
//

import Foundation
import Alamofire

class APICommunicator
{
    func request()
    {
        AF.request("https://httpbin.org/get").response{response in
            
            debugPrint(response)
        }
    }
}
