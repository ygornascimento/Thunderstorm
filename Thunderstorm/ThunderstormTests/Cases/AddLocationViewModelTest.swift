//
//  AddLocationViewModelTest.swift
//  ThunderstormTests
//
//  Created by Ygor Nascimento on 20/10/23.
//

import XCTest
@testable import Thunderstorm
import Combine


final class AddLocationViewModelTest: XCTestCase {
    
    private var subscriptions:  Set<AnyCancellable> = []
    
    override class func tearDown() throws {
        try super.tearDownWithError()
        
        subscriptions.removeAll()
    }

    func testTextFieldPlaceholder() async throws {
        let viewModel = await AddLocationViewModel(
        store: MockStore(),
        geocodingService: MockGeocodingClient(result: .success(Location.mocks)))
        
        let textFieldPlaceholder = await viewModel.textfiieldPlaceHolder
        
        XCTAssertEqual(textFieldPlaceholder, "Enter the name of a city...")
    }
    
    @MainActor
    func testAddLocation() async throws {
        let locationToAdd = Location.mock
        
        let store = MockStore()
        let geocodingService = MockGeocodingClient(result: .success([locationToAdd]))
        
        let viewModel = AddLocationViewModel(store: store,
                                             geocodingService: geocodingService)
        
        XCTAssertTrue(store.locations.isEmpty)
        
        let expectation = expectation(description: "Validade Locations")
        
        store.locationsPublisher
            .filter { locations in
                locations.contains { $0.id == locationToAdd.id }
            }
            .sink { _ in
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        await fulfillment(of: [expectation], timeout: 10.0)
    }

}
