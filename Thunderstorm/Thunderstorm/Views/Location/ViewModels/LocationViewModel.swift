//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation

@MainActor
final class LocationViewModel: ObservableObject {
    
    enum State {
        case fetching
        case data(
            currentConditionsViewModel: CurrentConditionsViewModel,
            forecastViewModel: ForecastViewModel
        )
        case error(message: String)
    }
    
    private let location: Location
    private let weatherService: WeatherService
    
    @Published private(set) var state: State = .fetching
    
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
            
            state = .data(
                currentConditionsViewModel: .init(currently: data.currently),
                forecastViewModel: .init(forecast: data.forecast)
            )
            
        } catch {
//            print("Unable to Fetch Weather Data \(error)")
            state = .error(message: "Thunderstorm isn't able to display weather data for \(locationName). Please try again later.")
        }
    }
}
