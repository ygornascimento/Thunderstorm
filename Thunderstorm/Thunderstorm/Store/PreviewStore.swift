//
//  PreviewStore.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 13/10/23.
//

import Combine

final class PreviewStore: Store {
    
    @Published private var locations = Location.previews
    
    var locationsPublisher: AnyPublisher<[Location], Never> {
        $locations
            .eraseToAnyPublisher()
    }
    
    func addLocation(_ location: Location) throws {
        locations.append(location)
    }
    
    func removeLocation(_ location: Location) throws {
        locations.removeAll { $0.id == location.id }
    }
    
    
}
