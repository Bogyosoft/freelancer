//
//  RegistartionUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 13..
//

import SwiftUI

struct RegistartionUIView: View {
    
    @State private var nameField: String = ""
    
    var body: some View {
        VStack
        {
            TextField("Név", text: $nameField)
            TextField("E-Mail", text: $nameField)
            TextField("Jelszó", text: $nameField)
            TextField("Jelszó megerősítés", text: $nameField)
            TextField("Telefon", text: $nameField)
        }
    }
}

struct RegistartionUIView_Previews: PreviewProvider {
    static var previews: some View {
        RegistartionUIView()
    }
}
