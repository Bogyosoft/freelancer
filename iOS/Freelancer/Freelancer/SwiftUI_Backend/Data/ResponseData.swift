//
//  ResponseData.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 13..
//

import Foundation

class ResponseData
{
    static let shared = ResponseData() //SINGELTON
    var szam = -1
    var jsonData: [String: Any] = ["nill": -1]
}
