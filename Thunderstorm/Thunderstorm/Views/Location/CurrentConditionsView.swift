//
//  CurrentConditionView.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import SwiftUI

struct CurrentConditionsView: View {
    
    let viewModel: CurrentConditionsViewModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.temperature)
                    .font(.largeTitle)
                
                Group {
                    HStack {
                        Image(systemName: "wind")
                            .foregroundColor(.gray)
                        Text(viewModel.windSpeed)
                    }
                    
                    Spacer()
                        .frame(height: 10.0)
                    Text(viewModel.summary)
                }
            }
            
            .padding()
            
            Spacer()
            
            Button {
//                viewModel.delete()
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct CurrentConditionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConditionsView(viewModel: .init(currently: WeatherData.preview.currently))
    }
}
