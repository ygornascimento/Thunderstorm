//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/09/23.
//

import Foundation

@MainActor
final class LocationCellViewModel: Identifiable, ObservableObject {
    
    private let location: Location
    private let weatherService: WeatherService
    
    @Published private var weatherData: WeatherData?
    
    var locationViewModel: LocationViewModel {
        .init(location: location)
    }
    
    private let measurementFormatter = ClearSkyFormatter()
    
    init(location: Location, weatherService: WeatherService) {
        self.location = location
        self.weatherService = weatherService
    }
    
    var locationName: String {
        location.name
    }
    
    var locationCountry: String {
        location.country
    }
    
    var sumary: String? {
        weatherData?.currently.summary
    }
    
    var windSpeed: String? {
        guard let windSpeed = weatherData?.currently.windSpeed else {
            return nil
        }
        
        return measurementFormatter.formatWindSpeed(windSpeed)
    }
    
    var temperature: String? {
        guard let temperature = weatherData?.currently.temperature else {
            return nil
        }
        
        return measurementFormatter.formatTemperature(temperature)
    }
    
    func start() async {
        do {
            weatherData = try await weatherService.weather(for: location)
        } catch {
            print("Unable to Fetch Weather Data for Location \(error)")
        }
    }
}
