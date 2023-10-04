//
//  GeocodingService.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 04/10/23.
//

import Foundation

protocol GeocodingService {
    func geocodeAddressString(_ addressString: String) async throws -> [Location]
}
