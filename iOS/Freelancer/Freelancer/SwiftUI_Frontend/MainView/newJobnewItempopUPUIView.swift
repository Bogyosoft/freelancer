//
//  newJobnewItempopUPUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//
//

import SwiftUI

struct newJobnewItempopUPUIView: View {
    
    
    @Binding var showPopUp: Bool
    @State var showNewItem: Bool = false
    @State var showNewJob: Bool = false
    
    var body: some View {
        HStack
        {
            VStack(spacing: 5)
            {
                //List
                //{
                Button(action: {
                    
                    self.showNewJob.toggle()
                    
                }) {
                    HStack
                    {
                        Image(systemName: "magnifyingglass")
                           .imageScale(.large)
                           .foregroundColor(Color("icons"))
                           .frame(width: 32, height: 32)
                        Text("Munkák böngészése").sheet(isPresented: $showNewJob) { CreateNewJobUIView()
                            
                        }
                    }
                }
                    .frame(minWidth: 0, maxWidth: 220, minHeight: 0, maxHeight: 50)
                    .background(Color(red: 211 / 255, green: 211 / 255, blue: 211 / 255))
                    .cornerRadius(20)
                    
                Button(action: {
                    self.showNewItem.toggle()
                    //print("FASZOM VAN")
                    //self.showPopUp.toggle()
                    
                    
                }) {
                    HStack
                    {
                        Image(systemName: "shippingbox")
                           .imageScale(.large)
                           .foregroundColor(Color("icons"))
                           .frame(width: 32, height: 32)
                        Text("Küldemény feladása").sheet(isPresented: $showNewItem) { CreateNewItemUIView() }
                        }
                    }
                   
                    
                    .frame(minWidth: 0, maxWidth: 220, minHeight: 0, maxHeight: 50)
                    .background(Color(red: 211 / 255, green: 211 / 255, blue: 211 / 255))
                    .cornerRadius(20)

                //}
            }
            .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 120)
            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            .cornerRadius(20)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
            
    }
}

struct newJobnewItempopUPUIView_Previews: PreviewProvider {
    static var previews: some View {
        newJobnewItempopUPUIView(showPopUp: .constant(true))
    }
}
