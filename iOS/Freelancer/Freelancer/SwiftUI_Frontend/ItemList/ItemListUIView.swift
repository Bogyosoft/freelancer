//
//  ItemListUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//

import SwiftUI

struct ItemListUIView: View {
    
    @Binding var itemsUI: [ItemData]
    
    var body: some View {
        HStack
        {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            List
            {
                ForEach(itemsUI)
                { item in
                    Text(item.destination)
                }
            }
        }.onAppear{
            print("LEKEREEEES")
            let lekertAdatok = Item(inData: ItemData(inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputName: "nil", inputLocation: "nil")))
            
            lekertAdatok.itemHandler.get(input: lekertAdatok, completion: {(valaszArray: Array<ItemData>)->Void in
                
                print(valaszArray[0].propertis)
                
                itemsUI = valaszArray
                
            })
            

            //let itemHandler = ItemDataHandler()
            
            //itemHandler.get(input: lekertAdatok)
        }
        
    }
}

/*struct ItemListUIView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListUIView(itemsUI: .constant([ItemData(inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputName: "nil", inputLocation: "nil"))]))
    }
}*/
