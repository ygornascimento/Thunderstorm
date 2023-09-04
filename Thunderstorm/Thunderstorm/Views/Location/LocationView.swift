//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import SwiftUI

struct LocationView: View {
    let viewModel: LocationViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            CurrentConditionsView(viewModel: viewModel.currentConditionsViewModel)
            Divider()
            ForecastView(viewModel: viewModel.forecastViewModel)
        }
        .navigationTitle(viewModel.locationName)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationView(viewModel: .init(location: .preview))
        }
    }
}
