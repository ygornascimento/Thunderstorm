//
//  ThunderstormApp.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/09/23.
//

import SwiftUI

@main
struct ThunderstormApp: App {
    var body: some Scene {
        WindowGroup {
            LocationsView(viewModel: .init())
        }
    }
}
