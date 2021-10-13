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
        //NavigationView
        //{
            VStack
            {
                Image(systemName: "car").resizable().frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3, alignment: .center)
                TextField("Név", text: $nameField).padding(.top)
                TextField("E-Mail", text: $emailField).padding(.top).keyboardType(.emailAddress)
                TextField("Jelszó", text: $passwordField).padding(.top)
                TextField("Jelszó megerősítés", text: $passwordAgainField).padding(.top)
                TextField("Telefon", text: $phoneField).padding(.top).keyboardType(.phonePad)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Regisztráció")
                }.padding()

            }.padding(.leading)
        //}//.navigationBarTitle("Registration")
         //   .navigationBarHidden(false)
        
    }
}

struct RegistartionUIView_Previews: PreviewProvider {
    static var previews: some View {
        RegistartionUIView()
    }
}
