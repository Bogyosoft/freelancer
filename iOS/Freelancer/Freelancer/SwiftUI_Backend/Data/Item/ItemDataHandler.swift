//
//  ItemDataHandler.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//

import Foundation


class ItemDataHandler
{
    internal var networkHandler: APICommunicator = APICommunicator()
    
    func get(input: Item)
    {
        print("ItemDataHandler_get()")
        networkHandler.GetRequest(input: input)
    }
    
    func post(input: Item)
    {
        print("ItemDataHandler_create()")
        input.source.id = ResponseData.shared.szam
        print("input.source.id = \(input.source.id)")
        if input.source.id == -1
        {
            print("\n\n\nHIBA LÉPETT FEL AZ ITEM REGISZTRÁLÁSAKOR(ROSSZ SOURCE ID)\n\n\n")
            return
        }
        networkHandler.PostRequest(input: input)
    }
}
