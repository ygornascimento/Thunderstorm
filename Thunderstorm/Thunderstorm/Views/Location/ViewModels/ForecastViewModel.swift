//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation


struct ForecastViewModel {
    private let forecast: [WeatherData.DayConditions]
    var forecastCellViewModels: [ForecastCellViewModel] {
        forecast.map(ForecastCellViewModel.init(dayConditions:))
    }
    
    init(forecast: [WeatherData.DayConditions]) {
        self.forecast = forecast
    }
}
