//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 16/09/23.
//

import SwiftUI

struct AddLocationView: View {
    
    @ObservedObject var viewModel: AddLocationViewModel
    var showsAddLocationView: Binding<Bool>
    
    var body: some View {
        VStack {
            TextField(viewModel.textfiieldPlaceHolder, text: $viewModel.query)
                .padding()
            
            List {
                ForEach(viewModel.addLocationCellViewModels) { cellViewModel in
                    AddLocationCell(viewModel: cellViewModel) {
                        viewModel.addLocation(with: cellViewModel.id)
                        showsAddLocationView.wrappedValue.toggle()
                    }
                }
            }
        }
    }
}

struct AddLocation_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AddLocationViewModel(geocodingService: GeocodingClient())
        
        return AddLocationView(viewModel: viewModel,
                               showsAddLocationView: .constant(true))
    }
}
