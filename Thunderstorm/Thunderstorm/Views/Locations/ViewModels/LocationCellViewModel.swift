//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/09/23.
//

import Foundation

struct LocationCellViewModel: Identifiable {
    
    private let location: Location
    
    var locationViewModel: LocationViewModel {
        .init(location: location)
    }
    
    var id: String {
        location.id
    }
    
    init(location: Location) {
        self.location = location
    }
    
    var locationName: String {
        location.name
    }
    
    var locationCountry: String {
        location.country
    }
    
    var sumary: String? {
        "Clear"
    }
    
    var windSpeed: String? {
        "10 mi/h"
    }
    
    var temperature: String? {
        "90 ºF"
    }
}
