//
//  ForecastCell.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import SwiftUI

struct ForecastCell: View {
    
    let viewModel: ForecastCellViewModel
    var body: some View {
        Text(viewModel.temperature)
    }
}

struct ForecastCell_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCell(viewModel: .init())
    }
}
