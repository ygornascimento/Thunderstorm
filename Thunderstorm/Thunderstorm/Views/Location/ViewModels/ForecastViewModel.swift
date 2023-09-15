//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation


struct ForecastViewModel {
    var forecastCellViewModels: [ForecastCellViewModel] {
        (0..<10).map { day in
            let increment = 24 * 3600 * TimeInterval(day)
            let forecastDate = Date().addingTimeInterval(increment)
            return ForecastCellViewModel(forecastDate: forecastDate)
            
        }
    }
}
