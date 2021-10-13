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
            VStack(alignment: .center)
            {
                Text("Freelancer")
                Image(systemName: "car").resizable().frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 3, alignment: .center)
                TextField("E-Mail", text: $eMailField).padding(.top).keyboardType(.emailAddress)
                SecureField("Jelszó", text: $passwordField).padding(.top)
                
                NavigationLink(destination: MainUIView()) {
                    Text("Login")
                }
                /*Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Login")
                }.padding()*/
                
                NavigationLink(destination: RegistartionUIView()) {
                    Text("Registartion")
                
                }.padding()
            }.padding()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        }
        
        
        
        
    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
    }
}
