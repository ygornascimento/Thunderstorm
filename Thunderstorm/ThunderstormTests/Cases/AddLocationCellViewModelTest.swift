//
//  AddLocationCellViewModelTest.swift
//  ThunderstormTests
//
//  Created by Ygor Nascimento on 20/10/23.
//

import XCTest
@testable import Thunderstorm

final class AddLocationCellViewModelTest: XCTestCase {

    func testIdentifiableConromance() throws {
        let location: Location = .mock
        let viewModel = AddLocationCellViewModel(location: location)
        
        XCTAssertEqual(viewModel.id, location.id)
    }
    
    func testComputerProperties() throws {
        let location: Location = .mock
        let viewModel = AddLocationCellViewModel(location: location)
        
        XCTAssertEqual(viewModel.name, location.name)
        XCTAssertEqual(viewModel.country, location.country)
        XCTAssertEqual(
            viewModel.coordinates,
            "\(location.latitude), \(location.longitude)")
    }

}
