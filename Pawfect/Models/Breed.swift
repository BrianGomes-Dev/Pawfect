//
//  Breed.swift
//  Pawfect
//
//  Created by Brian Gomes on 09/02/2024.
//

import Foundation

struct Breed: Codable, Identifiable {
    let id: String
    let name: String
    let subBreeds: [String]?
}
