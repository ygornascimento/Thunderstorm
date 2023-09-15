//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation


struct ForecastCellViewModel: Identifiable {
    
    private let forecastDate: Date
    
    private let dateFormatter = DateFormatter()
    
    var id: UUID {
        UUID()
    }
    
    var day: String {
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: forecastDate).capitalized
    }
    
    var date: String {
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: forecastDate).capitalized
    }
    
    var summary: String {
        "Clear"
    }
    
    var imageName: String {
        "sun.max"
    }
    
    var windSpeed: String {
        let windSpeed = Int.random(in: 0...30)
        return "\(windSpeed) mi/h"
    }
    
    var lowTemperature: String {
        let temperature = Int.random(in: 50...70)
        return "\(temperature) ºF"
    }
    
    var highTemperature: String {
        let temperature = Int.random(in: 71...90)
        return "\(temperature) ºF"
    }
    
    init(forecastDate: Date) {
        self.forecastDate = forecastDate
    }
}
