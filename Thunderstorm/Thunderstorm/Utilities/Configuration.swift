//
//  Configuration.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 15/10/23.
//

import Foundation


enum Configuration {
    
    private enum Keys {
        static let clearSkyBaseURL = "CLEAR_SKY_BASE_URL"
        static let clearSkyAPIKey = "CLEAR_SKY_API_KEY"
    }
    
    private static var infoDictionary: [String: Any] {
        Bundle.main.infoDictionary ?? [:]
    }
    
    static var clearSkyBaseURL: URL {
        let urlAsString = infoDictionary[Keys.clearSkyBaseURL] as! String
        
        return URL(string: urlAsString)!
    }
    
    static var clearSkyApiKey: String {
        infoDictionary[Keys.clearSkyAPIKey] as! String
    }
}
