//
//  LaunchViewUIView.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 10. 21..
//


import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var viewlaunch: ViewLaunch
    //@ObservedObject var settings = UserSettings.shared
    
    var body: some View
    {
        VStack
        {
            
            LoginUIView()
            /*
            if viewlaunch.currentPage == "newsView" {
                //NewsView()
            } else if viewlaunch.currentPage == "login" {
                LoginUIView()
            } else if viewlaunch.currentPage == "menuView" {
                /*if (!UserSettings.shared.loggedIn && !UserSettings.shared.guest)
                {
                    LoginPageUIView()
                }*/
            }*/
        }
    }
}

class ViewLaunch: ObservableObject {
    
    init() {
        print("IDE LEPETT BE")
        if !UserDefaults.standard.bool(forKey: "LaunchBefore") {
            currentPage = "newsView"
        } else {
            currentPage = "menuView"
        }
    }
    @Published var currentPage: String
}

