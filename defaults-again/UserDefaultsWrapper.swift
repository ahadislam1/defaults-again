//
//  UserDefaultsWrapper.swift
//  defaults-again
//
//  Created by Ahad Islam on 12/23/19.
//  Copyright © 2019 Ahad Islam. All rights reserved.
//

import Foundation

class UserDefaultsWrapper {
    
    static let manager = UserDefaultsWrapper()
    
    func store(fontSize: Double) {
        UserDefaults.standard.set(fontSize, forKey: fontSizeKey)
        
    }
    
    func store(username: String) {
        UserDefaults.standard.set(username, forKey: usernameKey)
    }
    
    func store(shouldUppercaseText: Bool) {
        UserDefaults.standard.set(shouldUppercaseText, forKey: shouldUppercaseTextKey)
    }
    
    func getFontSize() -> Double? {
        UserDefaults.standard.value(forKey: fontSizeKey) as? Double
    }
    
    func getUsername() -> String? {
        UserDefaults.standard.value(forKey: usernameKey) as? String
    }
    
    func getShouldUppercaseText() -> Bool? {
        UserDefaults.standard.value(forKey: shouldUppercaseTextKey) as? Bool
    }
    
    private init() {}
    
    private let usernameKey = "username"
    private let shouldUppercaseTextKey = "uppercaseText"
    private let fontSizeKey = "fontSize"
    
}
