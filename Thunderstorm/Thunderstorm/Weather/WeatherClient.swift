//
//  WeatherClient.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 14/10/23.
//

import Foundation

final class WeatherClient: WeatherService {
    
    private let baseURL = URL(string: "https//cocoacasts.com/clearsky")!
    
    func weather(for location: Location) async throws -> WeatherData {
        let queryItems: [URLQueryItem] = [
            .init(name: "lat", value: "\(location.latitude)"),
            .init(name: "long", value: "\(location.longitude)"),
            .init(name: "api_key", value: "tnperxfip8renk2hlzcccwetbnesby")
        ]
        
        let url = baseURL.appending(queryItems: queryItems)
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return try ClearSkyDecoder().decode(WeatherData.self, from: data)
    }
    
    
}
