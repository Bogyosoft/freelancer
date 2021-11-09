//
//  CreateNewItemUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//

import SwiftUI

struct CreateNewItemUIView: View {
    
    @State var destination: String = ""
    
    var body: some View {
        VStack
        {
            Text("Új küldemény feladása")
            HStack
            {
                Text("Cél: ")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $destination)
            }
            
            HStack
            {
                Text("Kiindulás: ")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            HStack
            {
                Text("Tulajdonságok: ")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            HStack
            {
                Text("Státusz: ")
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            }
            
            Button(action: {
                
                let item = Item()
                let hand = ItemDataHandler()
                hand.createItem(inputItem: item)
                
                
            }) {
                Text("Küldemény feladása")
            }
            
            
            
            
        }
        
    }
}

struct CreateNewItemUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewItemUIView()
    }
}
