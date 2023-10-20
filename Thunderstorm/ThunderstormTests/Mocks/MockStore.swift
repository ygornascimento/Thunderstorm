//
//  MockStore.swift
//  ThunderstormTests
//
//  Created by Ygor Nascimento on 20/10/23.
//

import Foundation
import Combine
@testable import Thunderstorm

final class MockStore: Store {
    @Published private var locations: [Location]
    
    init(locations: [Location] = []) {
        self.locations = locations
    }
    
    var locationsPublisher: AnyPublisher<[Location], Never> {
        $locations
            .eraseToAnyPublisher()
    }
    
    func addLocation(_ location: Location) throws {
        locations.append(location)
    }
    
    func removeLocation(_ location: Location) throws {
        locations.removeAll {$0.id == location.id}
    }
}
