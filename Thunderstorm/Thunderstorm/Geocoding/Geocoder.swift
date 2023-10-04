//
//  Geocoder.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 04/10/23.
//

import CoreLocation

protocol Geocoder {
    func geocodeAddressString(_ addressString: String) async throws -> [CLPlacemark]
}

