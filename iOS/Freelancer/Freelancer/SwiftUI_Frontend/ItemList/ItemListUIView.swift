//
//  ItemListUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//

import SwiftUI

struct ItemListUIView: View {
    
    @State var itemsUI: Array<ItemData> = Array<ItemData>()
    @State var spinner: Bool = false
    
    var body: some View {
        VStack
        {
            Text("Szállítmányok").font(.largeTitle)
            
            if !spinner
            {
                ProgressView()
            }
            else
            {
                List
                {
                    ForEach(itemsUI)
                    { item in
                        ItemDataRowView(item: item)
                        //Text(item.destination)
                    }
                }
            }
            
            
            
        }.onAppear{
            print("LEKEREEEES")
            let lekertAdatok = Item(inData: ItemData(inID: 0, inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputName: "nil", inputLocation: "nil")))
            
            lekertAdatok.itemHandler.get(input: lekertAdatok, completion: {(valaszArray: Array<ItemData>, valaszKesz: Bool)->Void in
                
                print(valaszArray[0].propertis)
                
                self.itemsUI = valaszArray
                self.spinner = valaszKesz
                
            })
        }
        
    }
}

struct ItemDataRowView: View {
    var item: ItemData

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(item.status)
                .foregroundColor(.primary)
                .font(.headline)
            HStack(spacing: 3) {
                Label(item.destination, systemImage: "car")
            }
            .foregroundColor(.secondary)
            .font(.subheadline)
        }
    }
}

struct ItemListUIView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListUIView()
    }
}
