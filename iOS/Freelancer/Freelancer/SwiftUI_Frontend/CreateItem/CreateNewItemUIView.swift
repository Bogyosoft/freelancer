//
//  CreateNewItemUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//

import SwiftUI

struct CreateNewItemUIView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var settings = UserSettingsWorker.shared
    
    @State var destination: String = ""
    @State var kiindulas: String = ""
    @State var tulajdonsag: String = ""
    @State var statusz: String = ""
    
    var body: some View {
        ZStack
        {
            VStack
            {
                Text("Új küldemény feladása")
                HStack
                {
                    Text("Cél: ")
                    TextField("Placeholder", text: $destination)
                }
                
                HStack
                {
                    Text("Kiindulás: ")
                    TextField("Placeholder", text: $kiindulas)
                }
                
                HStack
                {
                    Text("Tulajdonságok: ")
                    TextField("Placeholder", text: $tulajdonsag)
                }
                
                HStack
                {
                    Text("Státusz: ")
                    TextField("Placeholder", text: $statusz)
                }
                
                Button(action: {
                    
                    let sourceData = SourceData(inputID: -1, inputName: String(describing: UserSettingsWorker.shared.values["userName"]!), inputLocation: "locationBe")
                    let source = Source(inData: sourceData)
                    //let handSource = SourceHandler()
                    source.dataHandler.post(input: source, completion: {(valaszBefejezettseg: Bool, valaszID: Int)->Void in
                        
                        print("SOURCE POST ON CREATENEWITEM: \(valaszBefejezettseg), ID: \(valaszID)")
                        
                        if(valaszID == -1)
                        {
                            print("valami hiba volt a lekeresnel - createNewitem")
                            withAnimation()
                            {
                                UserSettingsWorker.shared.itemCreationFail.toggle()
                            }
                        }
                        else
                        {
                            print("Source ID beallitva!Mehet az ITEM creation")
                            source.data.id = valaszID
                            
                            let itemData = ItemData(inID: -1, inDestination: destination, inProperties: tulajdonsag, inStatus: statusz, inSource: source.data)
                            let item = Item(inData: itemData)
                            item.itemHandler.post(input: item, completion: {(valaszBefejezettseg: Bool)->Void in
                                
                                print("ITEM CREATION IS FINISHED? \(valaszBefejezettseg)")
                                
                                if valaszBefejezettseg
                                {
                                    withAnimation()
                                    {
                                        UserSettingsWorker.shared.itemCreationSuccess.toggle()
                                    }
                                }
                                else
                                {
                                    withAnimation()
                                    {
                                        UserSettingsWorker.shared.itemCreationFail.toggle()
                                    }
                                }
                                
                            })
                        }
                    })
                    
                })
                {
                    Text("Küldemény feladása")
                }
            }
            
            if settings.itemCreationSuccess
            {
                
                SuccessCardUIView().onAppear(perform: {
                    Haptics.shared.notify(.success)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        withAnimation()
                        {
                            UserSettingsWorker.shared.itemCreationSuccess.toggle()
                             
                        }
                    })
                    presentationMode.wrappedValue.dismiss()
                    
                }).opacity(0.9).transition(.opacity)
            }
            
            if settings.itemCreationFail
            {
                
                ErrorCardUIView().onAppear(perform: {
                    Haptics.shared.notify(.error)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        withAnimation()
                        {
                            UserSettingsWorker.shared.itemCreationFail.toggle()
                        }
                    })
                }).opacity(0.9).transition(.opacity)
            }
        }
        
        
    }
}

struct CreateNewItemUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewItemUIView()
    }
}
