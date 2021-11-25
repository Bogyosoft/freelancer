//
//  UserSettingsWorker.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 25..
//

import Foundation

class UserSettings : ObservableObject {
    var versionNumber = "1.0"
    static let shared = UserSettings() //SINGELTON
    
    @Published var loggedIn : Bool = false
    
    
    
    func saveUserSettings(value: Any, key: String){
        print("UserSettings_saveUserSettings: value: [\(value)], key: [\(key)]")
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    func loadUserSettings(key: String) -> Any
    {
        print("UserSettings_loadUserSettings: key: [\(key)]")
        return UserDefaults.standard.value(forKey: key) as Any
    }
}
