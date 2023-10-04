//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Ygor Nascimento on 16/09/23.
//

import Combine
import Foundation

@MainActor
internal final class AddLocationViewModel: ObservableObject {
    
    private let geocodingService: GeocodingService
    
    @Published var query = ""
    @Published private(set) var locations: [Location] = []
    
    var textfiieldPlaceHolder: String {
        "Enter the name of a city..."
    }
    
    var addLocationCellViewModels: [AddLocationCellViewModel] {
        locations.map(AddLocationCellViewModel.init)
    }
    
    private var subscriptions: Set<AnyCancellable> = []
    
    init(geocodingService: GeocodingService) {
        self.geocodingService = geocodingService
        
        setupBindings()
    }
    
    func addLocation(with id: String) {
        guard let locations = locations.first(where: {$0.id == id}) else {
            return
        }
        
        //Add Location
    }
    
    private func setupBindings() {
        $query
            .throttle(for: 1.0, scheduler: RunLoop.main, latest: true)
            .filter {!$0.isEmpty}
            .sink { [weak self] addressString in
                self?.geocodeAddressString(addressString)
            }.store(in: &subscriptions)
    }
    
    private func geocodeAddressString(_ addressString: String) {
        Task {
            do {
                locations = try await geocodingService.geocodeAddressString(addressString)
            } catch {
                print("Unable to Geocode \(addressString) \(error)")
            }
        }
    }
}
