//
//  LaunchViewUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 21..
//
//


import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var viewlaunch: ViewLaunch
    //@ObservedObject var settings = Token.shared
    
    var body: some View
    {
        VStack
        {
            if viewlaunch.currentPage == "newsView"
            {
                //NewsView()
            } else if viewlaunch.currentPage == "login"
            {
                LoginSignupView()
            }
            else if viewlaunch.currentPage == "menuView"
            {
                TabBar()
            }
        }.onAppear{
            
            print("LaunchView_onAppeare()")
            let eredmeny = UserSettingsWorker.shared.loadUserSettings(key: "loggedIn")
            let autologin = UserSettingsWorker.shared.loadUserSettings(key: "automataLogin")
            
            print("LOGED IN: \((eredmeny) as? Bool)")
            
            if eredmeny as? Bool == true
            {
                if autologin as? Bool == true
                {
                    print("BE VAN JELENTKEZVE MAR")
                    viewlaunch.currentPage = "menuView"
                    UserSettingsWorker.shared.loadEverySettings()
                }
                else
                {
                    print("be van loginolva de nincs autologi engedelyezve")
                }
                
            }
            else
            {
                print("NINCS BEJELENTKEZVE SENKI")
            }
            
            
            
           
            ///Token.shared.tokenHandler.post(input: Token.shared)
            ///Token.shared.tokenHandler.post(input: Token.shared)
        }
    }
}

class ViewLaunch: ObservableObject {
    
    init() {
        print("ViewLaunch()")
        if UserDefaults.standard.bool(forKey: "LaunchBefore")
        {
            currentPage = "newsView"
        } else {
            currentPage = "login"
        }
    }
    @Published var currentPage: String
}

