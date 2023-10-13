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
    
    init(store: Store) {
        self.store = store
    }
    
    func start() {
        store.locationsPublisher
            .map {  $0.map(LocationCellViewModel.init(location:)) }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
