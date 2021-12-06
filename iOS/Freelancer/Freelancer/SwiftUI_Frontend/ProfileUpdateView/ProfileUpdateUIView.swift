//
//  ProfileUpdateUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 20..
//
//

import SwiftUI

struct ProfileUpdateUIView: View {
    
    @State private var newEmail: String = ""
    @State private var newEmailAgain: String = ""
    
    @State var userUI = UserData(inUser: "", inPass: "", inRole: "", inScore: 0)
    @State var spinner: Bool = false
    
    var body: some View {
        
        VStack
        {
            HStack
            {
                VStack(alignment: .leading, spacing: 10)
                {
                    Text("Profil")
                      .font(.largeTitle)
                      .fontWeight(.heavy)
                      .foregroundColor(.black)
                    Capsule()
                        .fill(Color.yellowCustom)
                        .frame(width: 100, height: 5)
                }
                
            }
            .padding(.bottom, 15)
            .padding(.horizontal)
            .padding(.top, 40)
            .frame(minWidth: 0,maxWidth: .infinity,alignment: .topLeading)
            
            if !spinner
            {
                VStack
                {
                    ProgressView()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            else
            {
                if userUI.username != ""
                {
                    VStack {
                        Text("\(userUI.username)").font(.body)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text("\(userUI.role)")
                            .font(.callout)
                                .fontWeight(.heavy)
                                .foregroundColor(.gray)
                        Text("\(userUI.score)")
                            .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                else
                {
                    VStack
                    {
                        Text("Nincs elérhető adat!").foregroundColor(Color.black).font(.largeTitle).font(.system(size: 40))
                        Text("❌").font(.system(size: 60))
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            
            
        }
        .onAppear{
                print("PROFIL VIEW")
                let user = User(inData: UserData(inUser: UserSettingsWorker.shared.values["userName"] as? String ?? "", inPass: "0", inRole: "", inScore: 0))
                user.dataHandler.get(input: user) { valaszUser, valaszKesz in
                    print("PROFILLEKERES KESZ? :\(valaszKesz)")
                    print(valaszUser.username)
                    
                    if valaszKesz
                    {
                        self.userUI = valaszUser
                        spinner.toggle()
                    }
                    
                }
            }
        
    }
}

struct ProfileUpdateUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUpdateUIView()
    }
}
