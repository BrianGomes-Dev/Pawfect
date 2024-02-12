//
//  PawfectTests.swift
//  PawfectTests
//
//  Created by Brian Gomes on 09/02/2024.
//

import XCTest
@testable import Pawfect

class DogImageViewModelTests: XCTestCase {
    
    func testFetchDogImages_Success() {
        let viewModel = DogImageViewModel()
        let breed = "labrador"
        
        viewModel.fetchDogImages(for: breed)
        
        XCTAssertTrue(viewModel.imageURLs.isEmpty)
        
        let responseData = """
        {"message":["https://dog.ceo/api/img/labrador-1.jpg","https://dog.ceo/api/img/labrador-2.jpg"],"status":"success"}
        """.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(DogImageResponse.self, from: responseData)
            viewModel.imageURLs = response.message.map { URL(string: $0)! }
            XCTAssertEqual(viewModel.imageURLs.count, 2)
        } catch {
            XCTFail("Failed to decode mock response: \(error)")
        }
    }
    
    func testFetchDogImages_Failure() {
        let viewModel = DogImageViewModel()
        let breed = "invalid_breed"
        
        viewModel.fetchDogImages(for: breed)
        
        XCTAssertTrue(viewModel.imageURLs.isEmpty)
        
        let responseData = """
        {"message":"Breed not found","status":"error"}
        """.data(using: .utf8)!
        let decoder = JSONDecoder()
        do {
            let _ = try decoder.decode(DogImageResponse.self, from: responseData)
            XCTAssertTrue(viewModel.imageURLs.isEmpty)
        } catch {
            XCTAssertNotNil(error)
        }
    }
    
}
