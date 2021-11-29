//
//  ItemListUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//

import SwiftUI

struct ItemListUIView: View {
    var body: some View {
        HStack
        {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.onAppear{
            print("LEKEREEEES")
            //let lekertAdatok = Item()
            //let itemHandler = ItemDataHandler()
            
            //itemHandler.get(input: lekertAdatok)
        }
        
    }
}

struct ItemListUIView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListUIView()
    }
}
