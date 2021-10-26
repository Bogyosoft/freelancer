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
    func GetRequest()
    {
        AF.request("http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/user/", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response{response in
            
            debugPrint(response)
        }
        
    }
}
