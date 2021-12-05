//
//  DataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 12..
//
//

import Foundation

protocol DataHandler
{
    var networkHandler: APICommunicator{get set}
    
    func get(input: Transferable)
    
    func post(input: Transferable)
}
