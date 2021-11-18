//
//  newJobnewItempopUPUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 09..
//

import SwiftUI

struct newJobnewItempopUPUIView: View {
    
    
    @Binding var showPopUp: Bool
    @State var showNewItem: Bool = false
    
    var body: some View {
        HStack
        {
            VStack(spacing: 5)
            {
                //List
                //{
                Button(action: {}) {
                        Text("Új munka")
                    }
                    .frame(minWidth: 0, maxWidth: 180, minHeight: 0, maxHeight: 50)
                    .background(Color(red: 211 / 255, green: 211 / 255, blue: 211 / 255))
                    .cornerRadius(20)
                    
                Button(action: {
                    self.showNewItem.toggle()
                    print("FASZOM VAN")
                    //self.showPopUp.toggle()
                    
                    
                }) {
                    Text("Új tárgy").sheet(isPresented: $showNewItem) { CreateNewItemUIView() }
                    }
                    
                    .frame(minWidth: 0, maxWidth: 180, minHeight: 0, maxHeight: 50)
                    .background(Color(red: 211 / 255, green: 211 / 255, blue: 211 / 255))
                    .cornerRadius(20)

                //}
            }
            
            
            .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 120)
            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
            .cornerRadius(20)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            
    }
}

/*struct newJobnewItempopUPUIView_Previews: PreviewProvider {
    static var previews: some View {
        //@Binding var kamu: Bool = true
        //newJobnewItempopUPUIView(showNewItem: kamu)
    }
}*/
