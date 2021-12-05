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
                
                VStack
                {
                    Image("box")
                        .resizable()
                        .frame(width: 220, height: 220)
                        .shadow(color: Color.black.opacity(0.3), radius: 1, x: 5, y: 5)
                }
                
                HStack
                {
                    VStack(alignment: .leading, spacing: 10)
                    {
                        Text("Küldemény feladása")
                          .font(.largeTitle)
                          .fontWeight(.heavy)
                          .foregroundColor(.black)
                        Capsule()
                            .fill(Color.yellowCustom)
                            .frame(width: 100, height: 5)
                    }
                    
                }
                .padding(.bottom, 55)
                .padding(.horizontal)
                .padding(.top, 40)
                    .frame(
                          minWidth: 0,
                          maxWidth: .infinity,
                          alignment: .topLeading
                        )
                
                
                VStack(alignment: .center)
                {
                    VStack
                    {
                        HStack(spacing: 15)
                        {
                            Image(systemName: "airplane.departure").foregroundColor(Color.offWhite)
                            TextField("Kiindulás", text: self.$kiindulas).multilineTextAlignment(.leading).foregroundColor(Color.yellowCustom)
                                .accentColor(Color.yellowCustom)
                            
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    VStack
                    {
                        HStack(spacing: 15)
                        {
                            Image(systemName: "airplane.arrival").foregroundColor(Color.offWhite)
                            TextField("Cél", text: self.$destination).multilineTextAlignment(.leading).foregroundColor(Color.yellowCustom)
                                .accentColor(Color.yellowCustom)
                            
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
                    VStack
                    {
                        HStack(spacing: 15)
                        {
                            Image(systemName: "tag").foregroundColor(Color.offWhite)
                            TextField("Tulajdonságok", text: self.$tulajdonsag).multilineTextAlignment(.leading).foregroundColor(Color.yellowCustom)
                                .accentColor(Color.yellowCustom)
                            
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    
               
                    
                    /*HStack
                    {
                        Text("Státusz: ")
                        TextField("Placeholder", text: $statusz)
                    }*/
                }
                .padding(.bottom, 100)
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      alignment: .bottom
                    )
                
                
                
                Button(action: {
                    
                    let sourceData = SourceData(inputID: -1, inputName: String(describing: UserSettingsWorker.shared.values["userName"]!), inputLocation: kiindulas)
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
                    
                    
                }) {
                    Text("Küldemény feladása")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                        .background(Color.yellowCustom)
                        .clipShape(Capsule())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        
                }//.offset(y: 25)
                //.opacity(self.index == 0 ? 1: 0)
                .buttonStyle(GrowingButtonRegistration())
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      alignment: .bottom
                    )
            }
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .bottom
                )
            .padding(.bottom, 10)
            
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
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        withAnimation()
                        {
                            presentationMode.wrappedValue.dismiss()
                             
                        }
                    })
                    
                    
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
