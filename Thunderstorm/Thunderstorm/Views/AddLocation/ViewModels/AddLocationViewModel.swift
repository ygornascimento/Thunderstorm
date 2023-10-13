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
    
    enum State: Equatable {
        case empty
        case querying
        case message(String)
        case results([AddLocationCellViewModel])
    }
    
    private let geocodingService: GeocodingService
    
    @Published private(set) var state: State = .empty
    @Published private var isQuerying = false
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
        
        do {
            try UserDefaults.standard.addLocation(locations)
        } catch {
            print("Unable to add Location \(error)")
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
        
        $locations
            .map { $0.map(AddLocationCellViewModel.init) }
            .combineLatest($query, $isQuerying)
            .map { viewModels, query, isQuerying -> State in
                if isQuerying {
                    return .querying
                }
                
                if query.isEmpty {
                    return .empty
                }
                
                if viewModels.isEmpty {
                    return .message("No matches found...")
                } else {
                    return .results(viewModels)
                }
            }
            .eraseToAnyPublisher()
            .removeDuplicates()
            .assign(to: &$state)
    }
    
    private func geocodeAddressString(_ addressString: String) {
        isQuerying = true
        
        Task {
            do {
                locations = try await geocodingService.geocodeAddressString(addressString)
            } catch {
                locations = []
                print("Unable to Geocode \(addressString) \(error)")
            }
            
            isQuerying = false
        }
    }
}
