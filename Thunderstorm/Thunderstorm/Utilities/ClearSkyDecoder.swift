//
//  ClearSkyDecoder.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 14/10/23.
//

import Foundation

final class ClearSkyDecoder: JSONDecoder {
    
    override init() {
        super.init()
        
        dateDecodingStrategy = .secondsSince1970
    }
}
