//
//  CurrentConditionViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation


struct CurrentConditionViewModel {
    
    private let currently: WeatherData.CurrentConditions
    private let measurementFormatter = ClearSkyFormatter()
    
    
    var summary: String {
        currently.summary
    }
    
    var windSpeed: String {
        measurementFormatter.formatWindSpeed(currently.windSpeed)
    }
    
    var temperature: String {
        measurementFormatter.formatTemperature(currently.temperature)
    }
    
    init(currently: WeatherData.CurrentConditions) {
        self.currently = currently
    }
}
