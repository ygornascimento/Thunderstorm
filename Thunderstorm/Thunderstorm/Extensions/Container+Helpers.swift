//
//  Container+Helpers.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 18/10/23.
//

import Foundation
import Swinject

extension Container {
    static let shared = Container()
    static var store: Store {
        shared.resolve(Store.self)!
    }
}
