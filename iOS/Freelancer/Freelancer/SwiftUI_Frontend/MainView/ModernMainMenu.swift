//
//  ModernMainMenu.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 23..
//
//

import SwiftUI

struct ModernMainMenu: View {
    var body: some View {
        TabView {
           Home().tabItem {
              Image("IconHome")
              Text("Home")
           }
           .tag(1)
           /*ContentView().tabItem {
              Image("IconCards")
              Text("Certificates")
           }
           .tag(2)
           Settings().tabItem {
              Image("IconSettings")
              Text("Settings")
           }
           .tag(3)*/
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ModernMainMenu_Previews: PreviewProvider {
    static var previews: some View {
        ModernMainMenu()
    }
}
