//
//  AddLocationCell.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/10/23.
//

import SwiftUI

struct AddLocationCell: View {
    let viewModel: AddLocationCellViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.name)
                .font(.headline)
                .foregroundColor(.accentColor)
            
            Text(viewModel.country)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(viewModel.coordinates)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    AddLocationCell(viewModel: .init(location: .preview))
}
