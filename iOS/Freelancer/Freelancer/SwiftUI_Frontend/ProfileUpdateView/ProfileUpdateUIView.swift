//
//  ProfileUpdateUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 20..
//

import SwiftUI

struct ProfileUpdateUIView: View {
    
    @State private var newEmail: String = ""
    @State private var newEmailAgain: String = ""
    
    var body: some View {
        NavigationView
        {
            List
            {
                
                TextField("Új e-mail cím", text: $newEmail).padding(.top)
                TextField("Új e-mail cím megerősítése", text: $newEmailAgain).padding(.top)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("E-mail cím frissítése")
                }.padding()
                
                TextField("Új jelszó", text: $newEmail).padding(.top)
                TextField("Új jelszó megerősítése", text: $newEmailAgain).padding(.top)
                
                Button(action: {}) {
                    Text("Jelszófrissítése")
                }.padding()
                
                TextField("Új telefonszám", text: $newEmail).padding(.top)
                TextField("Új telefonszám megerősítése", text: $newEmailAgain).padding(.top)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Telefonszám frissítése")
                }.padding()
                
            }
        }.navigationTitle("Adatok módosítása")
        
    }
}

struct ProfileUpdateUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUpdateUIView()
    }
}
