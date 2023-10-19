//
//  ThunderstormApp.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/09/23.
//

import SwiftUI
import Swinject

@main
struct ThunderstormApp: App {
    
    init() {
        registerServices()
    }
    
    var body: some Scene {
        WindowGroup {
            LocationsView(viewModel: .init(store: Container.store, weatherService: WeatherClient()))
        }
    }
    
    private func registerServices() {
        Container.shared.register(Store.self) { _ in
            UserDefaults.standard
        }
    }
}
