//
//  Transferable.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 01..
//

import Foundation

protocol Transferable
{
    var link: String{get set}
    func createJSON() ->[String:Any]
}
