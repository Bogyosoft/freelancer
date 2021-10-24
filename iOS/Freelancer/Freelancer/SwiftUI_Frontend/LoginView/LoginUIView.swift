//
//  LoginUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 12..
//
//ikonok : https://www.flaticon.com/packs/transportation-icon-set
import SwiftUI




extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct SimpleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .background(
                Group {
                    if configuration.isPressed {
                        Circle()
                            .fill(Color.offWhite)
                        
                        /*Circle()
                            .fill(Color.offWhite)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: 2, y: 2)
                                    .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                            )
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 8)
                                    .blur(radius: 4)
                                    .offset(x: -2, y: -2)
                                    .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                            )*/
                        
                    } else {
                        Circle()
                            .fill(Color.offWhite)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                            .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
                    }
                }
            )
    }
}


/*struct GrowingButtonRegistration: ButtonStyle {
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
}*/


struct LoginUIView: View {
    
    @State private var eMailField: String = ""
    @State private var passwordField: String = ""
    var body: some View {
        ZStack
        {
            Color.offWhite
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.offWhite)
                .frame(width: 300, height: 300)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
            
            Button(action: {
                print("Button tapped")
            }) {
                Text("Bejelnetkezés")
                /*Image(systemName: "heart.fill")
                    .foregroundColor(.gray)*/
            }
            .buttonStyle(SimpleButtonStyle())
            
        }.edgesIgnoringSafeArea(.all)
        
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
        .onAppear(perform: {
            
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
