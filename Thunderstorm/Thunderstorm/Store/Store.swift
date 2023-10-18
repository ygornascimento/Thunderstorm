//
//  Store.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 13/10/23.
//

import Combine

protocol Store {
    var locationsPublisher: AnyPublisher<[Location], Never> { get }
    
    func addLocation(_ locations: Location) throws
    func removeLocation(_ location: Location) throws
}
