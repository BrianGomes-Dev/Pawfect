//
//  BreedListViewModelTests.swift
//  PawfectTests
//
//  Created by Brian Gomes on 12/02/2024.
//

import XCTest
@testable import Pawfect

class BreedListViewModelTests: XCTestCase {
    
    func testFetchBreeds_Success() {
        let viewModel = BreedListViewModel()
        let breedsExpectation = expectation(description: "Fetch Breeds")
        
        viewModel.fetchBreeds()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(viewModel.breeds)
            breedsExpectation.fulfill()
        }
        
        wait(for: [breedsExpectation], timeout: 10)
    }
    
    func testFilterBreeds_WithSearchText() {
        let viewModel = BreedListViewModel()
        viewModel.breeds = [
            Breed(id: "1", name: "Labrador Retriever", subBreeds: []),
            Breed(id: "2", name: "Golden Retriever", subBreeds: []),
            Breed(id: "3", name: "Poodle", subBreeds: [])
        ]
        
        let filteredBreeds = viewModel.filterBreeds(for: "Labrador")
        
        XCTAssertEqual(filteredBreeds.count, 1)
        XCTAssertEqual(filteredBreeds.first?.name, "Labrador Retriever")
    }
    
    func testFilterBreeds_WithoutSearchText() {
        let viewModel = BreedListViewModel()
        viewModel.breeds = [
            Breed(id: "1", name: "Labrador Retriever", subBreeds: []),
            Breed(id: "2", name: "Golden Retriever", subBreeds: []),
            Breed(id: "3", name: "Poodle", subBreeds: [])
        ]
        
        let filteredBreeds = viewModel.filterBreeds(for: "")
        
        XCTAssertEqual(filteredBreeds.count, 3)
    }
    
}
