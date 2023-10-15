//
//  ClearSkyFormatterTests.swift
//  ThunderstormTests
//
//  Created by Ygor Nascimento on 15/10/23.
//

import XCTest
@testable import Thunderstorm

final class ClearSkyFormatterTests: XCTestCase {

    func testFormatWindSpeed() throws {
        let locale = Locale(identifier: "pt-BR")
        let formatter = ClearSkyFormatter(locale: locale)
        
        XCTAssertEqual(formatter.formatWindSpeed(12.53), "20 km/h")
    }
    
//    func  testFormatTemperature() throws {
//        let locale = Locale(identifier: "nl-BE")
//        let formatter = ClearSkyFormatter(locale: locale)
//        
//        XCTAssertEqual(formatter.formatTemperature(32.0), "0 ºC")
//    }
    
    func testFormatTemperature() throws {
        let locale = Locale(identifier: "nl-BE")
        let formatter = ClearSkyFormatter(locale: locale)

        XCTAssertEqual(
            formatter.formatTemperature(32.0),
            "0 °C"
        )
    }

}
