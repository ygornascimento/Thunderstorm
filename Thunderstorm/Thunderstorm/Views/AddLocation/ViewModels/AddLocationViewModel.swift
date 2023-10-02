//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 16/09/23.
//

import Foundation

internal final class AddLocationViewModel: ObservableObject {
    
    @Published var query = ""
    
    var textfiieldPlaceHolder: String {
        "Enter the name of a city..."
    }
}
