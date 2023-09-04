//
//  CurrentConditionView.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 03/09/23.
//

import SwiftUI

struct CurrentConditionsView: View {
    
    let viewModel: CurrentConditionViewModel
    var body: some View {
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
    }
}

struct CurrentConditionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConditionsView(viewModel: .init())
    }
}
