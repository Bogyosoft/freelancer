//
//  UserSettingsWorker.swift
//  Freelancer
//
//  Created by Kiss Dániel Márk on 2021. 11. 25..
//

import Foundation
import UIKit

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
    
    var zoom: Double = 1
    @Published var loggedIn : Bool = false
    @Published var loginError = false
    @Published var loginSuccess = false
    
    @Published var itemCreationSuccess = false
    @Published var itemCreationFail = false
    
    
    @Published var jobAcceptSuccess = false
    @Published var jobAcceptFail = false
    
    @Published var jobAcceptID = -1
    
    
    func loadEverySettings()
    {
        /*
        let json = """
        {
        
                "id": 5,
                "location": "hh",
                "owner" :         {
                                "id": 3,
                                "role": "ROLE_USER",
                                "score": 0,
                                "username": "qq"
                },
            
            
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        do {
            print("PRÓBAAAAA")
            let product = try decoder.decode(receivedSourceData.self, from: json)
            print(product) // Prints "Durian"
        } catch {
            print("HIBAAAAAAAA")
            print(error.localizedDescription)
        }
        
        
        
         */
        
        
        
        for i in keyValues
        {
            print("EZ AZ \(i)")
            values[i] = loadUserSettings(key: i) as? String
        }
        
        print(values)
    }
    
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
