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
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle(viewModel.title)
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(viewModel: .init())
    }
}
