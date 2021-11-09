//
//  Home.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 23..
//

import SwiftUI

let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
let screen = UIScreen.main.bounds

struct Home: View {

    @State var show = false
    @State var showProfile = false
    @State var showPopUp = false
    
    @State var showNewItem = false

   var body: some View {
      ZStack(alignment: .top) {
          
          
          
          
         HomeList()
            .blur(radius: show ? 20 : 0)
            .scaleEffect(showProfile ? 0.95 : 1)
            .animation(.default)

          
          
         /*ContentView()
            .frame(minWidth: 0, maxWidth: 712)
            .cornerRadius(30)
            .shadow(radius: 20)
            .animation(.spring())
            .offset(y: showProfile ? statusBarHeight + 40 : UIScreen.main.bounds.height)*/

         HStack {
             MenuButton(show: $show)
                .offset(x: -40)
                 Spacer()

             MenuRight(showPopUp: $showPopUp)
                 .padding(.trailing, 5)//.offset(x: -16)
             
             
         }
         .offset(y: showProfile ? statusBarHeight : 80)
         .animation(.spring())
          
          if showPopUp
          {
              newJobnewItempopUPUIView(showPopUp: $showPopUp).padding(.top, 135)
                  
          }
          
          if show
          {
              BlurView(style: .light)
          }

         MenuView(show: $show)
      }
      .background(Color("background"))
      .edgesIgnoringSafeArea(.all)
      
   }
}

#if DEBUG
struct Home_Previews: PreviewProvider {
   static var previews: some View {
      Home()
         //.previewDevice("iPhone X")
   }
}
#endif

struct MenuRow: View {

   var image = "creditcard"
   var text = "My Account"

   var body: some View {
      return HStack {
         Image(systemName: image)
            .imageScale(.large)
            .foregroundColor(Color("icons"))
            .frame(width: 32, height: 32)

         Text(text)
            .font(.headline)
            .foregroundColor(.primary)

         Spacer()
      }
   }
}

struct Menu: Identifiable {
   var id = UUID()
   var title: String
   var icon: String
}

let menuData = [
   Menu(title: "Profil", icon: "person.crop.circle"),
   Menu(title: "Beállítások", icon: "gear"),
   Menu(title: "Fizetés", icon: "creditcard"),
   Menu(title: "Munkák", icon: "creditcard"),
   Menu(title: "Szállítmányok", icon: "creditcard"),
   //Menu(title: "Team", icon: "person.2"),
   Menu(title: "Kijelentkezés", icon: "arrow.uturn.down")
]

struct MenuView: View {

   var menu = menuData
   @Binding var show: Bool
   @State var showSettings = false
    @State var showProfile = false
    @EnvironmentObject var viewlaunch: ViewLaunch

   var body: some View {
      return HStack {
         VStack(alignment: .leading) {
            ForEach(menu) { item in
               if item.title == "Beállítások"
                {
                  Button(action: { self.showSettings.toggle() })
                   {
                     MenuRow(image: item.icon, text: item.title)
                        .sheet(isPresented: self.$showSettings) { Settings() }
                  }
               }
                else if item.title == "Kijelentkezés"
                {
                    Button(action: { self.viewlaunch.currentPage = "login" })
                     {
                       MenuRow(image: item.icon, text: item.title)
                          .sheet(isPresented: self.$showSettings) { /*Settings()*/ }
                    }
                }
                else if item.title == "Profil"
                {
                    Button(action: { self.showProfile.toggle() })
                     {
                       MenuRow(image: item.icon, text: item.title)
                          .sheet(isPresented: self.$showProfile) { ProfileUpdateUIView() }
                    }
                }
                else
                {
                  MenuRow(image: item.icon, text: item.title)
               }
            }
            Spacer()
         }
         .padding(.top, 20)
         .padding(30)
         .frame(minWidth: 0, maxWidth: 360)
         .background(Color("button"))
         .cornerRadius(30)
         .padding(.trailing, 60)
         .shadow(radius: 20)
         .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
         .animation(.default)
         .offset(x: show ? 0 : -UIScreen.main.bounds.width)
         .onTapGesture {
            self.show.toggle()
         }
         Spacer()
      }
      .padding(.top, statusBarHeight)
   }
}

struct CircleButton: View {

   var icon = "person.crop.circle"

   var body: some View {
      return HStack {
         Image(systemName: icon)
            .foregroundColor(.primary)
      }
      .frame(width: 44, height: 44)
      .background(Color("button"))
      .cornerRadius(30)
      .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
   }
}

struct MenuButton: View {
   @Binding var show: Bool

   var body: some View {
      return ZStack(alignment: .topLeading) {
         Button(action: { self.show.toggle() }) {
            HStack {
               Spacer()

               Image(systemName: "list.dash")
                  .foregroundColor(.primary)
            }
            .padding(.trailing, 18)
            .frame(width: 90, height: 60)
            .background(Color("button"))
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
         }
         Spacer()
      }
   }
}

struct MenuRight: View {

   @Binding var showPopUp: Bool
   @State var showUpdate = false

   var body: some View {
      return ZStack(alignment: .topTrailing) {
         HStack {
            Button(action: { self.showPopUp.toggle() }) {
                //CircleButton(icon: "person.crop.circle").sheet(isPresented: self.$show) { ProfileUpdateUIView() }
                CircleButton(icon: "plus.circle")//.sheet(isPresented: self.$show) { newJobnewItempopUPUIView() }
            }
            Button(action: { self.showUpdate.toggle() }) {
               CircleButton(icon: "bell")
                  .sheet(isPresented: self.$showUpdate) { UpdateList() }
            }
         }
         Spacer()
      }
   }
}
