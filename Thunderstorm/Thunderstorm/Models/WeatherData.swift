//
//  WeatherData.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 14/10/23.
//

import Foundation

struct WeatherData: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case currently, daily
    }
    
    private enum DailyCodingKeys: String, CodingKey {
        case data
    }
    
    let currently: CurrentConditions
    let forecast: [DayConditions]
    
    enum CodingKeys: CodingKey {
        case currently
        case forecast
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootCodingKeys.self)
        currently = try container.decode(CurrentConditions.self, forKey: .currently)
        
        let forecastContainer = try container.nestedContainer(keyedBy: DailyCodingKeys.self, forKey: .daily)
        forecast = try forecastContainer.decode([DayConditions].self, forKey: .data)
    }
    
}

extension WeatherData {
    
    struct CurrentConditions: Decodable {
        let time: Date
        let icon: String
        let summary: String
        let windSpeed: Float
        let temperature: Float
    }
}

extension WeatherData {
    
    struct DayConditions: Decodable {
        let time: Date
        let icon: String
        let summary: String
        let windSpeed: Float
        let temperatureHigh: Float
        let temperatureLow: Float
    }
}
