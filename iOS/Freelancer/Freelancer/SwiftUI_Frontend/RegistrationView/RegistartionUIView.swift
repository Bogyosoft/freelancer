//
//  RegistartionUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 13..
//

import SwiftUI

struct RegistartionUIView: View {
    
    @State private var nameField: String = ""
    @State private var emailField: String = ""
    @State private var passwordField: String = ""
    @State private var passwordAgainField: String = ""
    @State private var phoneField: String = ""
    
    var body: some View {
        VStack
        {
            Image(systemName: "car")
            TextField("Név", text: $nameField).padding(.top)
            TextField("E-Mail", text: $emailField).padding(.top)
            TextField("Jelszó", text: $passwordField).padding(.top)
            TextField("Jelszó megerősítés", text: $passwordAgainField).padding(.top)
            TextField("Telefon", text: $phoneField).padding(.top)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Regisztráció")
            }.padding()

        }.padding()
    }
}

struct RegistartionUIView_Previews: PreviewProvider {
    static var previews: some View {
        RegistartionUIView()
    }
}
