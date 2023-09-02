//
//  LocationsView.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/09/23.
//

import SwiftUI

struct LocationsView: View {
    
    let viewModel: LocationsViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 20.0) {
                    ForEach(viewModel.locationCellViewModels) { viewModel in
                        LocationCell(viewModel: viewModel)
                    }
                }
                .padding()
            }
            .navigationTitle("Thunderstorm")
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(viewModel: .init())
    }
}
