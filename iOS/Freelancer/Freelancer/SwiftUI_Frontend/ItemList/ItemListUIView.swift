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
        
        ScrollView {
            /*HStack {
                Image(systemName: "text.justify")
                    .font(.title3)
                    .foregroundColor(Color.white)
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 130, height: 40)
                Spacer()
                Image(systemName: "bell")
                    .font(.title2)
                    .foregroundColor(Color.white)
            }.padding(.horizontal)*/
            VStack {
                ForEach(itemsUI) { item in
                    CardDetector(item: item, position: .small)
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear{
                print("LEKEREEEES")
                let lekertAdatok = Item(inData: ItemData(inID: 0, inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputID: -1, inputName: "nil", inputLocation: "nil")))
                
                lekertAdatok.itemHandler.get(input: lekertAdatok, completion: {(valaszArray: Array<ItemData>, valaszKesz: Bool)->Void in
                    
                    print(valaszArray[0].propertis)
                    
                    self.itemsUI = valaszArray
                    self.spinner = valaszKesz
                    
                })
            }
        
        /*VStack
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
            /*print("LEKEREEEES")
            let lekertAdatok = Item(inData: ItemData(inID: 0, inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputID: -1, inputName: "nil", inputLocation: "nil")))
            
            lekertAdatok.itemHandler.get(input: lekertAdatok, completion: {(valaszArray: Array<ItemData>, valaszKesz: Bool)->Void in
                
                print(valaszArray[0].propertis)
                
                self.itemsUI = valaszArray
                self.spinner = valaszKesz
                
            })*/
        }*/
        
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

enum CardPosition: CaseIterable {
    case small, big
}


struct CardDetector: View {
    
    //var p: ListData
    var item: ItemData
    @State var position: CardPosition
    @Namespace var namespace
    var body: some View {
        
            Group {
                switch position {
                case .small:
                itemListRowNormalUIView()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(BlurView(style: .regular))
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onTapGesture {
                        withAnimation {
                            position = .big
                        }
                    }
                    .padding(.horizontal)
                case .big:
                itemListRowExpanedeUIView(namespace: namespace)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 270)
                    .background(BlurView(style: .regular))
                    .cornerRadius(10)
                    .padding(.vertical,6)
                    .onTapGesture {
                        withAnimation {
                            position = .small
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
}






struct ItemListUIView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListUIView()
    }
}
