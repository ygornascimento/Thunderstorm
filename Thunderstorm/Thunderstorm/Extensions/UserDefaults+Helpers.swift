//
//  UserDefaults+Helpers.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 13/10/23.
//

import Foundation

extension UserDefaults {
    
    private enum Keys {
        static let locations = "locations"
    }
    
    @objc var locations: Data? {
        get {
            data(forKey: Keys.locations)
        }
        set {
            set(newValue, forKey: Keys.locations)
        }
    }
}
