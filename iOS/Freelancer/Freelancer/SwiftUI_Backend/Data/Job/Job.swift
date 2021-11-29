//
//  Job.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//

import Foundation

class Job: Transferable
{
    var link: String = "http://freelancerbackend-env.eba-34kjxuhr.eu-central-1.elasticbeanstalk.com/api/v1/jobs/"
    
    func createJSON() -> [String : Any] {
        let id = 0//ID
        
        let parameters: [String: Any] = [
            "id" : id]
        
        return parameters
    }
    
    
}
