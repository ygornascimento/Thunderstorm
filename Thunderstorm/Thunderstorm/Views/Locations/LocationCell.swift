//
//  LocationCell.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 02/09/23.
//

import SwiftUI

struct LocationCell: View {
    
    @ObservedObject var viewModel: LocationCellViewModel
    
    var body: some View {
        HStack {
            VStackLayout(alignment: .leading) {
                Text(viewModel.locationName)
                    .font(.title)
                    .foregroundColor(.accentColor)
                Text(viewModel.locationCountry)
                    .font(.body)
                    .foregroundColor(.gray)
                
                Spacer()
                
                if let sumary = viewModel.sumary {
                    Text(sumary)
                }
            }
            
            Spacer()
            
            if let temperature = viewModel.temperature,
               let windSpeed = viewModel.windSpeed {
                VStackLayout(alignment: .trailing) {
                    HStack {
                        Image(systemName: "thermometer")
                            .foregroundColor(.gray)
                        Text(temperature)
                    }
                    
                    HStack {
                        Image(systemName: "wind")
                            .foregroundColor(.gray)
                        Text(windSpeed)
                    }
                    
                    Spacer()
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color.gray)
                .opacity(0.25)
        }
        .task {
            await viewModel.start()
        }
    }
}

struct LocationCell_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = LocationCellViewModel(location: .preview,
        weatherService: WeatherPreviewClient())
        
        return LocationCell(viewModel: viewModel)
    }
}
