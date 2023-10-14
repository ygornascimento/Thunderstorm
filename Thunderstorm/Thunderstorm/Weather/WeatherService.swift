//
//  WeatherService.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 14/10/23.
//

import Foundation

protocol WeatherService {
    func weather(for location: Location) async throws -> WeatherData
}
