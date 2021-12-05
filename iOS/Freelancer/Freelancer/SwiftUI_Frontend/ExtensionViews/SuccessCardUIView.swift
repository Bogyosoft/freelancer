//
//  SuccessCardUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 27..
//
//

import SwiftUI

import SwiftUI

struct SuccessCardUIView: View {
    var body: some View {
        VStack (alignment: .center)
        {
            Spacer()
            
            Image(systemName: "checkmark").foregroundColor(Color.green).font(.system(size: CGFloat(UserSettingsWorker.shared.zoom *  150), weight: .semibold)).padding(.top)
            Text("SIKER!")
                        .font(.system(size: CGFloat(UserSettingsWorker.shared.zoom *  20), weight: .bold, design: Font.Design.default))
                        .foregroundColor(Color.black)
                        .frame(minWidth: 0, maxWidth: .infinity)

            Spacer()
        }
        .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: 250)
        .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
        .cornerRadius(10)
    }
}

struct SuccessCardUIView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessCardUIView()
    }
}

