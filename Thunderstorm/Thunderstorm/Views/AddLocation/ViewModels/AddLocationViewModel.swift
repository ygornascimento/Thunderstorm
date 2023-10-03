//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 16/09/23.
//

import Foundation

internal final class AddLocationViewModel: ObservableObject {
    
    @Published var query = ""
    @Published private(set) var locations: [Location] = Location.previews
    
    var textfiieldPlaceHolder: String {
        "Enter the name of a city..."
    }
    
    var addLocationCellViewModels: [AddLocationCellViewModel] {
        locations.map(AddLocationCellViewModel.init)
    }
    
    func addLocation(with id: String) {
        guard let locations = locations.first(where: {$0.id == id}) else {
            return
        }
        
        //Add Location
    }
}
