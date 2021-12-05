//
//  ItemListUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 14..
//

import SwiftUI

struct ItemListUIView: View {
    
    @State var showAcceptJobMenu = false
    var body: some View {
        
        VStack
        {
            Text("Elérhető munkák")
            ItemList(showAcceptJobMenu: $showAcceptJobMenu)
        }
        
    }
}

struct ItemList: View {
    @ObservedObject var settings = UserSettingsWorker.shared
    @State var itemsUI: Array<ItemData> = Array<ItemData>()
    @State var spinner: Bool = false
    
    @Binding var showAcceptJobMenu:Bool
    
    var body: some View {
        
        ZStack
        {
            
            ScrollView {
                VStack {
                    ForEach(itemsUI) { item in
                        
                        
                        CardDetector(showAcceptJobMenu: $showAcceptJobMenu, item: item, position: .small)
                        
                        
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .onAppear{
                    print("LEKEREEEES")
                    let lekertAdatok = Item(inData: ItemData(inID: 0, inDestination: "nil", inProperties: "nil", inStatus: "nil", inSource: SourceData(inputID: -1, inputName: "nil", inputLocation: "nil")))
                    
                    lekertAdatok.itemHandler.get(input: lekertAdatok, completion: {(valaszArray: Array<ItemData>, valaszKesz: Bool)->Void in
                        
                        print(valaszArray[0].source.id)
                        
                        self.itemsUI = valaszArray
                        self.spinner = valaszKesz
                        
                    })
                }
            
            
            
            if settings.jobAcceptSuccess
            {
                
                SuccessCardUIView().onAppear(perform: {
                    Haptics.shared.notify(.success)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        withAnimation()
                        {
                            UserSettingsWorker.shared.jobAcceptSuccess.toggle()
                             
                        }
                    })
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        withAnimation()
                        {
                            deleteItem()
                             
                        }
                    })
                    
                    
                }).opacity(0.9).transition(.opacity)
            }
        }
        
        
    }

    func deleteItem() {
        var i = 0
        var stepper = 0
        for item in self.itemsUI{
            if item.id == UserSettingsWorker.shared.jobAcceptID
            {
                i = stepper
            }
            stepper += 1
        }
        let indexSet = IndexSet(integer: i)
        self.itemsUI.remove(atOffsets: indexSet)
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
    
    @Binding var showAcceptJobMenu:Bool
    //var p: ListData
    var item: ItemData
    @State var position: CardPosition
    @Namespace var namespace
    var body: some View {
        
        if showAcceptJobMenu
        {
            Group {
                switch position {
                case .small:
                    itemListRowNormalUIView(item: item)
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
                    itemListRowExpanedeUIView(item: item)
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
            }.cornerRadius(10)
        }
        else
        {
            itemListRowNormalUIView(item: item)
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
        }
            
    }
}






struct ItemListUIView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListUIView()
    }
}
