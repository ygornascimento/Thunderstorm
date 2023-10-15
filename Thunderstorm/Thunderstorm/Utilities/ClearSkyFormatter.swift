//
//  ClearSkyFormatter.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 15/10/23.
//

import Foundation

struct ClearSkyFormatter {
    private let mesurementFormatter = MeasurementFormatter()
    
    init(locale: Locale = .current) {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
        
        mesurementFormatter.locale = locale
        mesurementFormatter.numberFormatter = numberFormatter
    }
    
    func formatWindSpeed(_ windSpeed: Float) -> String {
        let measurement = Measurement(value: Double(windSpeed), unit: UnitSpeed.milesPerHour)
        
        return mesurementFormatter.string(from: measurement)
    }
    
    func formatTemperature(_ temperature: Float) -> String {
        let measurement = Measurement(value: Double(temperature), unit: UnitTemperature.fahrenheit)
        
        return mesurementFormatter.string(from: measurement)
    }
}
