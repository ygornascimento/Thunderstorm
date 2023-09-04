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
        ScrollView {
            LazyVGrid(columns: [GridItem()]) {
                ForEach(viewModel.forecastCellViewModels) { viewModel in
                    ForecastCell(viewModel: viewModel)
                }
            }
            .padding()
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(viewModel: .init())
    }
}
