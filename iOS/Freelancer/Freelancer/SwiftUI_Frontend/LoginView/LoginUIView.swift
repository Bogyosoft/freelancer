//
//  LoginUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 12..
//
//ikonok : https://www.flaticon.com/packs/transportation-icon-set
import SwiftUI

struct LoginUIView: View {
    
    @State private var eMailField: String = ""
    @State private var passwordField: String = ""
    var body: some View {
        NavigationView
        {
            VStack
            {
                Text("Freelancer")
                Image(systemName: "car").frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2, alignment: .center)
                TextField("E-Mail", text: $eMailField)
                SecureField("Jelszó", text: $passwordField)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Login")
                }.padding()
                
                NavigationLink(destination: RegistartionUIView()) {
                    Text("Registartion")
                
                }.padding()
            }.padding()
        }
        
        
        
        
    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
    }
}
