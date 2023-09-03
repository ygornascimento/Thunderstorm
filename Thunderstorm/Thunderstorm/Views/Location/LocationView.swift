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
            ForecastView(viewModel: viewModel.forecastViewModel)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(viewModel: .init(location: .preview))
    }
}
