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
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.day)
                    .font(.title)
                    .foregroundColor(.accentColor)
                
                Group {
                    Text(viewModel.date)
                    
                    Spacer()
                    
                    Text(viewModel.summary)
                }
                .font(.body)
                .foregroundColor(.darkGray)
                
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Image(systemName: viewModel.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40.0)
                    .foregroundColor(.darkGray)
                
                Spacer()
                
                Text(viewModel.windSpeed)
                    .font(.body)
                    .foregroundColor(.darkGray)
                
                HStack {
                    Text(viewModel.lowTemperature)
                    Text("-")
                    Text(viewModel.highTemperature)
                }
                .font(.body)
                .foregroundColor(.darkGray)
            }
        }
    }
}

struct ForecastCell_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCell(viewModel: .init(dayConditions: WeatherData.preview.forecast[0]))
    }
}
