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
    
    private enum AddLocationResult{
        case success
        case failure
    }
    
    private var subscriptions:  Set<AnyCancellable> = []
    
    override func tearDownWithError() throws {
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
    
    func testAddLocationSuccess() async throws {
        try await runAddLocationTest(result: .success)
    }
    
    func testAddLocationFailure() async throws {
        try await runAddLocationTest(result: .failure)
    }
    
    @MainActor
    private func runAddLocationTest(result: AddLocationResult) async throws {
        let locationToAddID = result == .success ? Location.mock.id : "abc"
        
        let store = MockStore()
        let geocodingService = MockGeocodingClient(result: .success([Location.mock]))
        
        let viewModel = AddLocationViewModel(store: store,
                                             geocodingService: geocodingService)
        
        XCTAssertTrue(store.locations.isEmpty)
        
        let expectation = expectation(description: "Validade Locations")
        expectation.isInverted = result == .failure
        
        store.locationsPublisher
            .filter { locations in
                locations.contains { $0.id == locationToAddID }
            }
            .sink { _ in
                expectation.fulfill()
            }.store(in: &subscriptions)
        
        viewModel.$locations
            .sink { _ in
                DispatchQueue.main.async {
                    viewModel.addLocation(with: locationToAddID)
                }
            }.store(in: &subscriptions)
        
        viewModel.query = "Brussels"
        
        await fulfillment(of: [expectation], timeout: 10.0)
    }

}
