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
    
    var title: String {
        "Thunderstorm"
    }
    
    var addLocationTitle: String {
        "Add a Location"
    }
    
    @Published private(set) var locationCellViewModels: [LocationCellViewModel] = []
    
    var addLocationViewModel: AddLocationViewModel {
        AddLocationViewModel(geocodingService: GeocodingClient())
    }
    
    func start() {
        UserDefaults.standard.publisher(for: \.locations)
            .compactMap { $0 }
            .decode(type: [Location].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .map {  $0.map(LocationCellViewModel.init(location:)) }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }
}
