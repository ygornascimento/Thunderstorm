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
        Text("Current Condition View")
    }
}

struct CurrentConditionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConditionsView(viewModel: .init())
    }
}
