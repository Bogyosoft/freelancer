//
//  Settings.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 23..
//
//
import SwiftUI

struct Settings: View {

    @State var receive = false
   @State var number = 1
   @State var selection = 1
   @State var date = Date()
   @State var email = ""
   @State var submit = false

   var body: some View {
      NavigationView {
         Form {
            /*Toggle(isOn: $receive) {
               Text("Recieve Notifications")
            }
            Stepper(value: $number, in: 1...10) {
               Text("\(number) Notification\(number > 1 ? "s" : "") per week")
            }
            Picker(selection: $selection, label: Text("Favourite course")) {
               Text("SwiftUI").tag(1)
               Text("React").tag(2)
            }
            DatePicker(selection: $date, label: {
               Text("Date")
            })*/
            Section(header: Text("Autologin")) {
                Toggle(isOn: $receive)
                {
                    Text("Automatikus bejelentkezés").foregroundColor(Color.black)
                }
                .toggleStyle(SwitchToggleStyle(tint: Color.yellowCustom))
                .onChange(of: receive) { value in
                            //perform your action here...
                            print(value)
                    UserSettingsWorker.shared.saveUserSettings(value: value, key: "automataLogin")
                        }
            }
            /*Button(action: { self.submit.toggle() }) {
               Text("Submit")
            }
            .alert(isPresented: $submit, content: {
               Alert(title: Text("Thanks"), message: Text("Email: \(email)"))
            })
             Text("Settings")*/
         }
         .navigationBarTitle("Beállítások")
      }.onAppear
       {
           self.receive = UserSettingsWorker.shared.loadUserSettings(key: "automataLogin") as? Bool ?? false
       }
   }
}

#if DEBUG
struct Settings_Previews: PreviewProvider {
   static var previews: some View {
      Settings()
   }
}
#endif
