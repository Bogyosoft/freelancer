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
    
    //https://developer.apple.com/documentation/swift/dictionary
    //DICTIONARY FOR ALL UD - VALUE:KEY
    
    private let keyValues = ["loggedIn", "userName", "userToken", "userPassword"]
    
    private let defaultValues : [String:Any] = ["loggedIn":false,
                                                "userName":"nilUserName",
                                                "userToken":"nilToken",
                                                "userPassword":"nilPassword"]
    
    @Published var values : [String:Any] = ["loggedIn":false,
                                            "userName":"nilUserName",
                                            "userToken":"nilToken",
                                            "userPassword":"nilPassword"]
    
    
    
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
    
    func resetUserSetting()
    {
        print("UserSettings_resetUserSettings")
        values = defaultValues
        for key in keyValues
        {
            if let value = values[key]
            {
                saveUserSettings(value: value, key: key)
            }
            
        }
    }
}