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
    
    @State var index = 0
    
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
                }
                
                ZStack
                {
                    
                    RegistrationView(index: self.$index).zIndex(Double(self.index))
                    
                    LoginView(index: self.$index)
                    
                    
                }
                
            }.background(Color.offWhite).edgesIgnoringSafeArea(.all)
        }.edgesIgnoringSafeArea(.all)
            
    }
}

struct LoginView: View
{
    @State var email = ""
    @State var pass = ""
    
    @Binding var index : Int
    
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
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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
        }
    }
    
}

struct RegistrationView: View
{
    @State var email = ""
    @State var pass = ""
    @State var passAgain = ""
    
    @Binding var index : Int
    
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
                    
                    VStack
                    {
                        HStack(spacing: 15)
                        {
                            Image(systemName: "eye.slash.fill").foregroundColor(Color.offWhite)
                            SecureField("Jelszó újra", text: self.$passAgain)
                            
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
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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

//Hullám
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
