//
//  LaunchViewUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 21..
//


import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var viewlaunch: ViewLaunch
    @ObservedObject var settings = Token.shared
    
    var body: some View
    {
        VStack
        {
            if viewlaunch.currentPage == "newsView"
            {
                //NewsView()
            } else if viewlaunch.currentPage == "login"
            {
                if(Token.shared.tokenHandlerReady)
                {
                    TabBar()
                }
                else
                {
                    
                    LoginSignupView()
                }
                
            }
            else if viewlaunch.currentPage == "menuView"
            {
                TabBar()
                
                /*if (!UserSettings.shared.loggedIn && !UserSettings.shared.guest)
                {
                    LoginPageUIView()
                }*/
            }
        }.onAppear{
            /*print("CHECK FOR LOGED IN STATET")
            print("IF LOGED IN ")->DO IT by LocalSave data -> és akkor megy a login
             
            print("NO LOGIN DATA AVAILABLE->do nothing, loginView will got it")*/
            print("LaunchView_onAppeare()")
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

