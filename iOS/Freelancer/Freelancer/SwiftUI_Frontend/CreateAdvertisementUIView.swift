//
//  CreateAdvertisementUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 20..
//
//

import SwiftUI

struct CreateAdvertisementUIView: View {
    
    @State private var weight = 50.0
    @State private var volume = 50.0
    
    @State private var price: String  = ""
    
    @State private var description: String  = ""
    
    var body: some View {
        VStack
        {
            Text("Régió")
            Picker(selection: .constant(1), label: Text("Picker")) {
                Text("1").tag(1)
                Text("2").tag(2)
            }
            HStack
            {
                Text("Súly")
                Text("\(Int(weight)) kg")
            }
            
            Slider(
                        value: $weight,
                        in: 0...100,
                        onEditingChanged: { editing in
                            //isEditing = editing
                        }
                    )

            HStack
            {
                Text("Térfogat")
                Text("\(Int(volume)) liter")
            }
            
            Slider(
                        value: $volume,
                        in: 0...100,
                        onEditingChanged: { editing in
                            //isEditing = editing
                        }
                    )
            Text("Ár")
            
            TextField("pl.: 1000 Ft", text: $price)
            
            TextField("Leírás", text: $description)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Hirdetés feladása")
            }


        }
        
    }
}

struct CreateAdvertisementUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAdvertisementUIView()
    }
}
