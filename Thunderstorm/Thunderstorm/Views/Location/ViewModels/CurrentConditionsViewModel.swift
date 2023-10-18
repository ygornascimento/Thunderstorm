//
//  CurrentConditionViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation


struct CurrentConditionsViewModel {
    
    private let location: Location
    private let store: Store
    
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
    
    init(location: Location, store: Store, currently: WeatherData.CurrentConditions) {
        self.location = location
        self.store = store
        self.currently = currently
    }
    
    func delete() {
        do {
            try store.removeLocation(location)
        } catch {
            print("Unable to Remove Location\(error)")
        }
    }
}
