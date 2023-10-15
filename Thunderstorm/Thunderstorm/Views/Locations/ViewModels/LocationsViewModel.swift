//
//  LocationsViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/09/23.
//

import Foundation
import Combine
 
@MainActor
final class LocationsViewModel: ObservableObject {
    
    private let store: Store
    private let weatherService: WeatherService
    
    var title: String {
        "Thunderstorm"
    }
    
    var addLocationTitle: String {
        "Add a Location"
    }
    
    @Published private(set) var locationCellViewModels: [LocationCellViewModel] = []
    
    var addLocationViewModel: AddLocationViewModel {
        AddLocationViewModel(store: store, geocodingService: GeocodingClient())
    }
    
    init(store: Store, weatherService: WeatherService) {
        self.store = store
        self.weatherService = weatherService
    }
    
    func start() {
        let weatherService = self.weatherService
        store.locationsPublisher
            .map { locations in
                locations.map { location in
                        LocationCellViewModel(location: location, weatherService: weatherService)
                }
            }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
