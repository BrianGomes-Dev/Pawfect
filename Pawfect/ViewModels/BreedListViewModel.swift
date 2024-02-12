//
//  BreedListViewModel.swift
//  Pawfect
//
//  Created by Brian Gomes on 09/02/2024.
//

import Foundation

class BreedListViewModel: ObservableObject {
    
    @Published var breeds: [Breed]?
    
    private var apiService = DogAPIService.shared
    
    func fetchBreeds() {
        apiService.fetchBreeds { [weak self] breeds in
            DispatchQueue.main.async {
                self?.breeds = breeds
            }
        }
    }
    
    func filterBreeds(for searchText: String) -> [Breed] {
        
        guard let breeds = breeds else {
            return []
        }
        
        if !searchText.isEmpty {
            return breeds.filter { $0.name.lowercased().contains(searchText.lowercased())}
        } else {
            return breeds
        }
    }
}
