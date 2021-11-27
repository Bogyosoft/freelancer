//
//  LoginSignupView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 23..
//
//https://morioh.com/p/bddd3240a700
//https://youtu.be/84gRTVNvOz4
import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let offWhite2 = Color(red: 215 / 255, green: 215 / 255, blue: 230 / 255)
    
    static let yellowCustom = Color(red: 100 / 255, green: 100 / 255, blue: 230 / 255)
}

struct LoginSignupView: View {
    
    @ObservedObject var settings = UserSettingsWorker.shared
    @ObservedObject var token = Token.shared
    @State var index = 0
    @EnvironmentObject var viewlaunch: ViewLaunch
    
    var body: some View {
        ZStack
        {
            Color.offWhite
            
            VStack
            {
                VStack
                {
                    Image("villam")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .shadow(color: Color.black.opacity(0.3), radius: 1, x: 5, y: 5)
                }
                
                ZStack
                {
                    
                    RegistrationView(index: self.$index).zIndex(Double(self.index))
                    
                    LoginView(index: self.$index)
                    
                    
                }
                
            }.background(Color.offWhite).edgesIgnoringSafeArea(.all)
            
            
            if settings.loginSuccess
            {
                
                SuccessCardUIView().onAppear(perform: {
                    Haptics.shared.notify(.success)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        withAnimation()
                        {
                            UserSettingsWorker.shared.loginSuccess.toggle()
                            //idáig ezt lent volt a Button click actionnel
                            //viszont ha ott van, az előbb fut le mint ez a delay(2mp)
                            // így viszont a LaunchScreen logikája előbb életbe lép
                            //ne kérezd hogy találtam ki hogy ez a baja... :DDDD
                            UserSettingsWorker.shared.loggedIn = true
                            self.viewlaunch.currentPage = "menuView"
                            //self.viewlaunch.currentPage = "menuView"
                        }
                    })
                    
                }).opacity(0.9).transition(.opacity)
            }
            
            if settings.loginError
            {
                
                ErrorCardUIView().onAppear(perform: {
                    Haptics.shared.notify(.error)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        withAnimation()
                        {
                            UserSettingsWorker.shared.loginError.toggle()
                        }
                    })
                }).opacity(0.9).transition(.opacity)
            }
            
            
        }.edgesIgnoringSafeArea(.all)
            .onAppear(perform: {
                
                /*let com:APICommunicator = APICommunicator()
                
                com.GetRequest()*/
            })
            
    }
}

struct GrowingButtonRegistration: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

struct LoginView: View{
    
    @ObservedObject var settings = Token.shared
    
    @State var email = ""
    @State var loginSuccess = false
    @State var pass = ""
    @EnvironmentObject var viewlaunch: ViewLaunch
    
    @Binding var index : Int
    @State var attemptsEmail: Int = 0
    @State var attemptsPassword: Int = 0
    
    var body: some View
    {
        ZStack(alignment: .bottom)
        {
            VStack
            {
                
                VStack
                {
                    HStack
                    {
                        VStack(spacing: 10)
                        {
                            Text("Belépés")
                                .foregroundColor(self.index == 0 ? .black : .gray)
                                .font(.title)
                                .fontWeight(.bold)
                            Capsule()
                                .fill(self.index == 0 ? Color.yellowCustom : Color.clear)
                                .frame(width: 100, height: 5)
                        }
                        Spacer(minLength: 0)
                    }.padding(.top, 40)
                    
                    //EMAIL
                    VStack
                    {
                        HStack(spacing: 15)
                        {
                            Image(systemName: "envelope.fill").foregroundColor(Color.offWhite)
                            TextField("E-mail", text: self.$email)
                            
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    //PASSWORD
                    VStack
                    {
                        HStack(spacing: 15)
                        {
                            Image(systemName: "eye.slash.fill").foregroundColor(Color.offWhite)
                            SecureField("Jelszó", text: self.$pass)
                            
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    //FORGET PASS
                    HStack
                    {
                        Spacer(minLength: 0)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Elfelejtett jelszó?").foregroundColor(Color.gray.opacity(0.6))
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                }
                .padding()
                .padding(.bottom, 65)
                .background(Color.offWhite2)
                .clipShape(CShape())
                .contentShape(CShape())
                
                .onTapGesture {
                    self.index = 0
                }
                .cornerRadius(35)
                .padding(.horizontal, 20)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 10, y: -5)
                
                //EZ LEHET A ZSTACKBEN KENE
            }
            Button(action: {
                print("LOGIN STARTED")
                self.attemptsEmail = 0
                self.attemptsPassword = 0
                //withAnimation(.default)
                //{
                    if self.email != ""
                    {
                        print("nem ures email")
                        self.attemptsEmail = 0
                    }
                    else
                    {
                        self.attemptsEmail += 1
                    }
                    
                    if self.pass != ""
                    {
                        print("jelszo minden ok")
                        self.attemptsPassword = 0
                    }
                    else
                    {
                        self.attemptsPassword += 1
                    }
                    
                    if self.attemptsEmail == 0 && self.attemptsPassword == 0
                    {
                        print("MEHET a LOGIN CHECK")
                        Token.shared.user.data.username = self.email
                        Token.shared.user.data.password = self.pass
                        
                        //https://medium.com/@dhavalkansara51/completion-handler-in-swift-with-escaping-and-nonescaping-closures-1ea717dc93a4
                        Token.shared.tokenHandler.post(input: Token.shared, completion: {(valasz: Bool)->Void in
                            
                            print("RESPONSE FROM CONPLETION: \(valasz)")
                            print("tokenReceived: \(Token.shared.tokenReceived) ")
                            if(Token.shared.tokenReceived)
                            {
                                print("MENTENI KELL A LOGIN ADATOKAT!!!")
                                UserSettingsWorker.shared.values["loggedIn"] = true
                                UserSettingsWorker.shared.values["userName"] = Token.shared.user.data.username
                                UserSettingsWorker.shared.values["userToken"] = Token.shared.token
                                UserSettingsWorker.shared.values["userPassword"] = Token.shared.user.data.password
                                UserSettingsWorker.shared.saveUserSettings(value: UserSettingsWorker.shared.values["loggedIn"]!, key: "loggedIn")
                                UserSettingsWorker.shared.saveUserSettings(value: UserSettingsWorker.shared.values["userName"]!, key: "userName")
                                UserSettingsWorker.shared.saveUserSettings(value: UserSettingsWorker.shared.values["userToken"]!, key: "userToken")
                                UserSettingsWorker.shared.saveUserSettings(value: UserSettingsWorker.shared.values["userPassword"]!, key: "userPassword")
                                
                                
                                
                                withAnimation()
                                {
                                    UserSettingsWorker.shared.loginSuccess.toggle()
                                }
                            }
                            else
                            {
                                print("NEM JO CREDENTIALS")
                                
                                withAnimation()
                                {
                                    UserSettingsWorker.shared.loginError = true
                                }
                                
                                print("HALO \(UserSettingsWorker.shared.loginError)")
                                
                            }
                            
                            
                        })
                        
                    }
                    else
                    {
                        print("HIBA nincs megadva mindne field kitoltve")
                        withAnimation()
                        {
                            UserSettingsWorker.shared.loginError.toggle()
                        }
                    }
                    
               // }
                
                
                
                //
                
                
                
                
            }) {
                Text("Belépés")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.yellowCustom)
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    
            }.offset(y: 25)
            .opacity(self.index == 0 ? 1: 0)
            .buttonStyle(GrowingButtonRegistration())
        }
    }
                   
}

struct RegistrationView: View{
    @State var email = ""
    @State var pass = ""
    @State var passAgain = ""
    
    @Binding var index : Int
    
    @State var attemptsEmail: Int = 0
    @State var attemptsPassword: Int = 0
    
    var body: some View
    {
        ZStack(alignment: .bottom)
        {
            VStack
            {
                
                VStack
                {
                    HStack
                    {
                        Spacer(minLength: 0)
                        VStack(spacing: 10)
                        {
                            Text("Regisztráció")
                                .foregroundColor(self.index == 1 ? .black : .gray)
                                .font(.title)
                                .fontWeight(.bold)
                            Capsule()
                                .fill(self.index == 1 ? Color.yellowCustom : Color.clear)
                                .frame(width: 100, height: 5)
                        }
                        
                        
                    }.padding(.top, 40)
                    
                    //EMAIL
                    VStack
                    {
                        HStack(spacing: 15)
                        {
                            Image(systemName: "envelope.fill").foregroundColor(Color.offWhite)
                            TextField("E-mail", text: self.$email).modifier(Shake(animatableData: CGFloat(attemptsEmail)))
                            
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 40)
                    //PASSWORD
                    VStack
                    {
                        HStack(spacing: 15)
                        {
                            Image(systemName: "eye.slash.fill").foregroundColor(Color.offWhite)
                            SecureField("Jelszó", text: self.$pass).modifier(Shake(animatableData: CGFloat(attemptsPassword)))
                            
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                    VStack
                    {
                        HStack(spacing: 15)
                        {
                            Image(systemName: "eye.slash.fill").foregroundColor(Color.offWhite)
                            SecureField("Jelszó újra", text: self.$passAgain).modifier(Shake(animatableData: CGFloat(attemptsPassword)))
                            
                        }
                        
                        Divider().background(Color.white.opacity(0.5))
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                }
                .padding()
                .padding(.bottom, 65)
                .background(Color.offWhite2)
                .clipShape(CShapeRight())
                .contentShape(CShapeRight())
                .onTapGesture {
                    self.index = 1
                }
                .cornerRadius(35)
                .padding(.horizontal, 20)
                .shadow(color: /*self.index == 1 ? */Color.black.opacity(0.3)/* : Color.clear*/, radius: 5, x: 10, y: -5)
                
                //EZ LEHET A ZSTACKBEN KENE
            }
            Button(action: {
                self.attemptsEmail = 0
                self.attemptsPassword = 0
                withAnimation(.default)
                {
                    if self.email != ""
                    {
                        print("nem ures email")
                        self.attemptsEmail = 0
                    }
                    else
                    {
                        self.attemptsEmail += 1
                    }
                    
                    if self.pass != "" && self.passAgain != "" && self.passAgain == self.pass
                    {
                        print("jelszo minden ok")
                        self.attemptsPassword = 0
                    }
                    else
                    {
                        self.attemptsPassword += 1
                    }
                    
                    if self.attemptsEmail == 0 && self.attemptsPassword == 0
                    {
                        print("LoginSigUpView_registration()")
                        let user = User(inData: UserData(inUser: self.email, inPass: self.pass))
                        user.dataHandler.registerUser(inputUser: user)
                    }
                    
                }
            }) {
                Text("Regisztrálás")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.yellowCustom)
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            }.offset(y: 25)
                .opacity(self.index == 1 ? 1: 0)
        }
    }
    
}

//Hullám - bal
struct CShape: Shape
{

    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

//Hullám - jobb
struct CShapeRight: Shape
{

    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
