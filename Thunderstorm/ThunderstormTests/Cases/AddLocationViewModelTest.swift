//
//  AddLocationViewModelTest.swift
//  ThunderstormTests
//
//  Created by Ygor Nascimento on 20/10/23.
//

import XCTest
@testable import Thunderstorm


final class AddLocationViewModelTest: XCTestCase {

    func testTextFieldPlaceholder() async throws {
        let viewModel = await AddLocationViewModel(
        store: MockStore(),
        geocodingService: MockGeocodingClient(result: .success(Location.mocks)))
        
        let textFieldPlaceholder = await viewModel.textfiieldPlaceHolder
        
        XCTAssertEqual(textFieldPlaceholder, "Enter the name of a city...")
    }

}
