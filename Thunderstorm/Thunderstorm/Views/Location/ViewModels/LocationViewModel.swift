//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation


struct LocationViewModel {
    
    private let location: Location
    
    var currentConditionsViewModel: CurrentConditionViewModel {
        .init()
    }
    
    var forecastViewModel: ForecastViewModel {
        .init()
    }
    
    var locationName: String {
        location.name
    }
    
    init(location: Location) {
        self.location = location
    }
}
