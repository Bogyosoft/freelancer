//
//  UserSettingsWorker.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 25..
//

import Foundation

class UserSettingsWorker : ObservableObject {
    var versionNumber = "1.0"
    static let shared = UserSettingsWorker() //SINGELTON
    
    //DICTIONARY FOR ALL UD - VALUE:KEY
    @Published var values : [String:Any] = ["loggedIn":false]
    
    
    
    func saveUserSettings(value: Any, key: String){
        print("UserSettings_saveUserSettings: value: [\(value)], key: [\(key)]")
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    func loadUserSettings(key: String) -> Any
    {
        print("UserSettings_loadUserSettings: key: [\(key)]")
        let result = UserDefaults.standard.value(forKey: key) as Any
        print("UserSettings_loadUserSettings: result: [\(result)]")
        return result
    }
}
