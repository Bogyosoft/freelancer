//
//  LoginUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 12..
//
//ikonok : https://www.flaticon.com/packs/transportation-icon-set
import SwiftUI


struct GrowingButtonRegistration: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.1, alignment: .center).background(Color.orange)
            //.background(Color.blue)
            .foregroundColor(.blue)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct LoginUIView: View {
    
    @State private var eMailField: String = ""
    @State private var passwordField: String = ""
    var body: some View {
        NavigationView
        {
            VStack(alignment: .center)
            {
                //Text("Freelancer")
                /*Image(systemName: "car")*/
                Image("truckIKON").resizable().frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2, alignment: .center)
                    //.clipShape(<#T##shape: Shape##Shape#>)
                
                
                
                TextField("E-Mail", text: $eMailField).padding(.top).keyboardType(.emailAddress)
                SecureField("Jelszó", text: $passwordField).padding(.top)
                
                NavigationLink(destination: MainUIView()) {
                    Text("Bejelnetkezés")
                }.frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.1, alignment: .center).background(Color.red)
                    .clipShape(Capsule()).padding()
                /*Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Login")
                }.padding()*/
                
                NavigationLink(destination: RegistartionUIView()) {
                    Text("Regisztráció")
                
                }//.frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.1, alignment: .center).background(Color.orange)
                    //.clipShape(Capsule())
                    .buttonStyle(GrowingButtonRegistration())
                
                
            }.padding()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .top)
        }.onAppear(perform: {
            
            //let com:APICommunicator = APICommunicator()
            
            //com.request()
        })
        
        
        
        
    }
}

struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
    }
}
