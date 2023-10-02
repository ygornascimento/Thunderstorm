//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 16/09/23.
//

import SwiftUI

struct AddLocationView: View {
    
    @ObservedObject var viewModel: AddLocationViewModel
    var body: some View {
        VStack {
            TextField(viewModel.textfiieldPlaceHolder, text: $viewModel.query)
        }
    }
}

struct AddLocation_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationView(viewModel: .init())
    }
}
