//
//  MainUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 13..
//

import SwiftUI

struct MainUIView: View {
    
    //let data = (1...4).map { "Item \($0)" }
    let data = ["Szállítok","Feladok","Hirdetések böngészése","Szállítmányaim"]
    let columns = [
            //GridItem(.fixed(100)),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    var body: some View {
        //NavigationView {
        
        VStack
        {
            //Text("MAIN")
            LazyVGrid(columns: columns) {
                
                ForEach(data, id: \.self)
                { item in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text(item)
                    }.frame(width: 100, height: 100, alignment: .center)
                   
                    
                }
            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        
            
            
        /*}.navigationBarTitle("Freelancer")
        .navigationBarHidden(true)*/
        
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
