//
//  GeocodePreviewClient.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 04/10/23.
//

import Foundation

struct GeocodePreviewClient: GeocodingService {
    func geocodeAddressString(_ addressString: String) async throws -> [Location] {
        Location.previews
    }
}
