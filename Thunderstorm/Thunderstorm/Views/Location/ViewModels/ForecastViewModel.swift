//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import Foundation


struct ForecastViewModel {
    var forecastCellViewModels: [ForecastCellViewModel] {
        (0..<10).map { _ in ForecastCellViewModel() }
    }
}
