//
//  GeocodingClient.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 04/10/23.
//

import CoreLocation

final class GeocodingClient: GeocodingService {
    
    enum GeocodingError: Error {
        case invalidAddressString
        case requestFailed
    }
    
    private let geocoder = CLGeocoder()
    
    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        guard !addressString.isEmpty else {
            throw GeocodingError.invalidAddressString
        }
        
        do {
            return try await geocoder.geocodeAddressString(addressString)
                .compactMap(Location.init(placemark:))
        } catch {
            print("Unable to Geocode \(addressString) \(error)")
            throw GeocodingError.requestFailed
        }
    }
}
