//
//  LoginSignupView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 23..
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    
    static let offWhite2 = Color(red: 215 / 255, green: 215 / 255, blue: 230 / 255)
}

struct LoginSignupView: View {
    
    @State var email = ""
    @State var pass = ""
    
    var body: some View {
        GeometryReader{_ in
            
            VStack
            {
                Image(systemName: "car")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack
                {
                    HStack
                    {
                        Text("Belépés")
                            .font(.title)
                            .fontWeight(.bold)
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
                .cornerRadius(35)
                .padding(.horizontal, 20)
            }
            
        }.background(Color.offWhite).edgesIgnoringSafeArea(.all)
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

struct LoginSignupView_Previews: PreviewProvider {
    static var previews: some View {
        LoginSignupView()
    }
}
