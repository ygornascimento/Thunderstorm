//
//  WeatherData+Preview.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 14/10/23.
//

import Foundation

extension WeatherData {
    static var preview: Self {
        let url = Bundle.main.url(forResource: "clearsky", withExtension: "json")!
        
        let data = try! Data(contentsOf: url)
        
        return try! ClearSkyDecoder().decode(WeatherData.self, from: data)
    }
}
