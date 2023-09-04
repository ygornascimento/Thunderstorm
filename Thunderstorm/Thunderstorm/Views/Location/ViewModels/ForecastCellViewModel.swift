//
//  ForecastCellViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation


struct ForecastCellViewModel: Identifiable {
    var id: UUID {
        UUID()
    }
    
    var temperature: String {
        let temperature = Int.random(in: 50...80)
        return "\(temperature) ºF"
    }
}
