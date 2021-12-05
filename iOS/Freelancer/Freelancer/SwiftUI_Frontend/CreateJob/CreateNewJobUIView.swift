//
//  CreateNewJobUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 18..
//

import SwiftUI

struct CreateNewJobUIView: View {
    
    @ObservedObject var settings = UserSettingsWorker.shared
    @State var showAcceptJobMenu = true
    var body: some View {
        
        
        ZStack
        {
            VStack
            {
                
                VStack
                {
                    Image("workerhat")
                        .resizable()
                        .frame(width: 220, height: 220)
                        .shadow(color: Color.black.opacity(0.3), radius: 1, x: 5, y: 5)
                }
                
                HStack
                {
                    VStack(alignment: .leading, spacing: 10)
                    {
                        Text("Munkák böngészése")
                          .font(.largeTitle)
                          .fontWeight(.heavy)
                          .foregroundColor(.black)
                        Capsule()
                            .fill(Color.yellowCustom)
                            .frame(width: 100, height: 5)
                    }
                    
                }
                .padding(.bottom, 15)
                .padding(.horizontal)
                .padding(.top, 40)
                    .frame(
                          minWidth: 0,
                          maxWidth: .infinity,
                          alignment: .topLeading
                        )
                
                
                VStack(alignment: .center)
                {
                    ItemList(showAcceptJobMenu: $showAcceptJobMenu)
                }
                //.padding(.bottom, 100)
                .frame(
                      minWidth: 0,
                      maxWidth: .infinity,
                      maxHeight: UIScreen.main.bounds.size.height/2.5,
                      alignment: .bottom
                    )
                
                
                
               /* Button(action: {
                    
                    /*
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
                    */
                    
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
                    )*/
            }
            
            .frame(
                  minWidth: 0,
                  maxWidth: .infinity,
                  minHeight: 0,
                  maxHeight: .infinity,
                  alignment: .bottom
                )
            .edgesIgnoringSafeArea(.bottom)
            //.padding(.bottom, 10)
            
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
                    //presentationMode.wrappedValue.dismiss()
                    
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
        
        
        
        /*VStack
        {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.onAppear()
        {
            //inputName: String(describing: UserSettingsWorker.shared.values["userName"]!)
            let sourceData = SourceData(inputID: 9,inputName: "Dani" , inputLocation: "Danitoo")
            
            let itemData = ItemData(inID: 5, inDestination: "Pistinek", inProperties: "Torekenz", inStatus: "TO_BE_DELIVERED", inSource: sourceData)
            let jobData = JobData(inID: 0, inFreelancer: "000000", inItem: itemData)
            let job = Job(inData: jobData, itemIn: Item(inData: itemData))
            
            job.jobHandler.post(input: job, completion: {(valaszBefejezettseg: Bool)->Void in
                
                print("VALASZ FOR CREATEJOB: \(valaszBefejezettseg)")
            })
            
        }*/
        
    }
}

struct CreateNewJobUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewJobUIView()
    }
}
