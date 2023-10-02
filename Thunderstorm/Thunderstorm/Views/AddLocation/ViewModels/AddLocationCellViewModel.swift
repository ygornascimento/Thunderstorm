//
//  AddLocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/10/23.
//

import Foundation

struct AddLocationCellViewModel {
    
    private let location: Location
    
    init(location: Location) {
        self.location = location
    }
    
    var name: String {
        location.name
    }
    
    var country: String {
        location.country
    }
    
    var coordinates: String {
        "\(location.latitude), \(location.longitude)"
    }
}
