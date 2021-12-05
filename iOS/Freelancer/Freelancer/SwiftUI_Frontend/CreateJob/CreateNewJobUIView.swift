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
       
        
    }
}

struct CreateNewJobUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewJobUIView()
    }
}
