//
//  ForecastView.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import SwiftUI

struct ForecastView: View {
    
    let viewModel: ForecastViewModel
    var body: some View {
        Text("Forecast View")
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: .init())
    }
}
