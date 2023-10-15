//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import SwiftUI

struct LocationView: View {
    @ObservedObject var viewModel: LocationViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            if let currentConditionsViewModel = viewModel.currentConditionsViewModel,
               let forecastViewModel = viewModel.forecastViewModel {
                CurrentConditionsView(viewModel: currentConditionsViewModel)
                Divider()
                ForecastView(viewModel: forecastViewModel)
            } else {
                ProgressView()
            }
            
            
        }
        .navigationTitle(viewModel.locationName)
        .task {
            await viewModel.start()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationView(viewModel: .init(location: .preview,
                                         weatherService: WeatherPreviewClient()))
        }
    }
}
