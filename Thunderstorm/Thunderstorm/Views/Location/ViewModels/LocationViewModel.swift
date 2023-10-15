//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    
    private let location: Location
    private let weatherService: WeatherService
    
    @Published private(set) var currentConditionsViewModel: CurrentConditionViewModel?
    @Published private(set) var forecastViewModel: ForecastViewModel?
    
    var locationName: String {
        location.name
    }
    
    init(location: Location, weatherService: WeatherService) {
        self.location = location
        self.weatherService = weatherService
    }
    
    func start() async {
        do {
            let data = try await weatherService.weather(for: location)
            
            currentConditionsViewModel = .init(currently: data.currently)
            forecastViewModel = .init(forecast: data.forecast)
        } catch {
            print("Unable to Fetch Weather Data \(error)")
        }
    }
}
