//
//  UserDefaults+Store.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 13/10/23.
//

import Combine
import Foundation


extension UserDefaults: Store {
    var locationsPublisher: AnyPublisher<[Location], Never> {
        publisher(for: \.locations)
            .compactMap { $0 }
            .decode(type: [Location].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
    
    
}
