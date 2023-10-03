//
//  AddLocationCell.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/10/23.
//

import SwiftUI

struct AddLocationCell: View {
    let viewModel: AddLocationCellViewModel
    let didTapPlusButton: () -> Void
    
    var body: some View {
        HStack {
            Button (action: didTapPlusButton) {
                Image(systemName: "plus")
                    .padding()
                    .tint(.green)
                    .frame(width: 5.0, height: 5.0)
            }
            .padding(.all, 10.0)
            .background(.white)
            
            Spacer()
                .frame(width: 20.0)
            
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
            
            Spacer()
        }
    }
}

#Preview {
    AddLocationCell(viewModel: .init(location: .preview)) {
        ()
    }
}
