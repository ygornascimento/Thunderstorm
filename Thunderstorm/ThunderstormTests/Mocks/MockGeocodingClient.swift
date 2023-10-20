//
//  MockGeocodinClient.swift
//  ThunderstormTests
//
//  Created by Ygor Nascimento on 20/10/23.
//

import Foundation
@testable import Thunderstorm


struct MockGeocodingClient: GeocodingService {
    
    enum GeocodingError: Error {
        case requestFailed
    }
    
    let result: Result<[Location], GeocodingError>
    
    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        switch result {
        case .success(let locations):
            return locations
        case .failure(let error):
                throw error 
        }
    }
}
