//
//  TabBar.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 23..
//
//

import SwiftUI

struct TabBar: View {
   var body: some View {
       Home()
      /*TabView {
         Home().tabItem {
            Image("IconHome")
            Text("Home")
         }
         .tag(1)
         /*ContentView()*/EmptyView().tabItem {
            Image("IconCards")
            Text("Feladványok")
         }
         .tag(2)
          /*ContentView()*/EmptyView().tabItem {
             Image("IconCards")
             Text("Munkák")
          }
          .tag(3)
         /*Settings()*/EmptyView().tabItem {
            Image("IconSettings")
            Text("Settings")
         }
         .tag(4)
      }*/
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
