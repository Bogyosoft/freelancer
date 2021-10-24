//
//  TabBar.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 23..
//

import SwiftUI

struct TabBar: View {
   var body: some View {
      TabView {
         Home().tabItem {
            Image("IconHome")
            Text("Home")
         }
         .tag(1)
         ContentView().tabItem {
            Image("IconCards")
            Text("Feladványok")
         }
         .tag(2)
          ContentView().tabItem {
             Image("IconCards")
             Text("Munkák")
          }
          .tag(3)
         Settings().tabItem {
            Image("IconSettings")
            Text("Settings")
         }
         .tag(4)
      }
      .edgesIgnoringSafeArea(.top)
   }
}

#if DEBUG
struct TabBar_Previews: PreviewProvider {
   static var previews: some View {
      TabBar()
//         .environment(\.colorScheme, .dark)
   }
}
#endif
